//
//  SummonerGameHistoryViewController.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/03.
//

import RxCocoa
import RxSwift
import UIKit

final class SummonerGameHistoryViewController: UIViewController {
    
    // MARK: Properties
    
    private let summonerGameHisoryTableView = SummonerGameHistoryTableView()
    private let disposBag = DisposeBag()
    let viewModel: SummoneGameHistoryViewModel
    
    // MARK: - Initializers
    
    init(viewModel: SummoneGameHistoryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = SummoneGameHistoryViewModel()
        super.init(coder: coder)
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonInit()
    }
    
    // MARK: - Methods
    
    private func commonInit() {
        setupBackgroundColor(.paleGrey)
        setupSubviews()
        setupConstraints()
        setupTableView()
        bindViewModel()
    }
    
    private func bindViewModel() {
        let refreshButton = summonerGameHisoryTableView.getRefreshGameHistoryButton()
        let refreshButtonDidTap = refreshButton.rx.tap.asObservable()
        
        let output = viewModel.transfrom(.init(
            viewDidLoad: Observable.just(()),
            refreshButtonDidTap: refreshButtonDidTap,
            scrollDidEnd: summonerGameHisoryTableView.rx.prefetchRows.asObservable())
        )
        
        output.loadSummonerInformation.map { $0.1.games }
            .observe(on: MainScheduler.instance)
            .bind(
                to: summonerGameHisoryTableView.rx.items(
                    cellIdentifier: SummonerGameInformationCell.identifier,
                    cellType: SummonerGameInformationCell.self
                )
            ) { (index, element, cell) in
                cell.setupContent(with: element)
                
            }.disposed(by: disposBag)
        
        output.loadSummonerInformation.map { $0.0 }
            .observe(on: MainScheduler.instance)
            .bind(onNext: { summoner in
                self.summonerGameHisoryTableView.setupHeaderView(with: summoner)
            }).disposed(by: disposBag)
        
        output.loadSummonerInformation.map { $0.1 }
            .observe(on: MainScheduler.instance)
            .bind(onNext: { matches in
                self.summonerGameHisoryTableView.setupHeaderView(with: matches)
            }).disposed(by: disposBag)
    }
    
    private func setupBackgroundColor(_ color: UIColor?) {
        view.backgroundColor = color
    }
    
    private func setupSubviews() {
        [summonerGameHisoryTableView]
            .forEach { view.addSubview($0) }
    }
    
    private func setupConstraints() {
        setupSummonerGameHisoryTableViewConstraints()
    }
    
    private func setupSummonerGameHisoryTableViewConstraints() {
        NSLayoutConstraint.activate([
            summonerGameHisoryTableView.topAnchor.constraint(
                equalTo: view.topAnchor
            ),
            summonerGameHisoryTableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            summonerGameHisoryTableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            summonerGameHisoryTableView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            )
        ])
    }
    
    private func setupTableView() {
        summonerGameHisoryTableView.rx.itemSelected.bind(
            onNext: { [weak self] indexPath in
                self?.summonerGameHisoryTableView.deselectRow(
                    at: indexPath,
                    animated: false
                )
            }
        ).disposed(by: disposBag)
    }
}
