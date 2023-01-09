//
//  SummonerGameHistoryViewController.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/03.
//

import UIKit

final class SummonerGameHistoryViewController: UIViewController {

    // MARK: Properties
    
    private var games: [Matches.Game] = []
    private var createdDate: Int?
    private var currentPage = 1
    private let viewModel = SummonerGameHistoryViewModel()
    private let summonerGameHisoryTableView = SummonerGameHistoryTableView()
    
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
        setupRefreshGameHistoryButton()
        fetchMatchInformation()
        fetchSummonerInformation()
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
        summonerGameHisoryTableView.setupDelegate(self)
        summonerGameHisoryTableView.setupDataSource(self)
    }
    
    private func fetchSummonerInformation() {
        viewModel.fetchSummonerAllInformation { [weak self] result in
            switch result {
            case .success(let summoner):
                DispatchQueue.main.async {
                    self?.summonerGameHisoryTableView.setupHeaderView(with: summoner)
                }
            case .failure(let error):
                return
            }
        }
    }
    
    private func fetchMatchInformation() {
        viewModel.fetchSummonerMatches { [weak self] result in
            switch result {
            case .success(let matches):
                print(matches.positions)
                self?.games.append(contentsOf: matches.games)
                self?.currentPage = 1
                self?.summonerGameHisoryTableView.setupHeaderView(with: matches)
                DispatchQueue.main.async {
                    self?.summonerGameHisoryTableView.reloadData()
                }
            case .failure(let failure):
                return
            }
        }
    }
    
    private func setupRefreshGameHistoryButton() {
        let button = summonerGameHisoryTableView.getRefreshGameHistoryButton()
        button.addTarget(
            self,
            action: #selector(refreshGameHistoryButtonDidTap),
            for: .touchUpInside
        )
    }
    
    @objc private func refreshGameHistoryButtonDidTap() {
        games.removeAll()
        fetchSummonerInformation()
        fetchMatchInformation()
    }
}

extension SummonerGameHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        
        return games.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = summonerGameHisoryTableView.dequeueReusableCell(
            withIdentifier: SummonerGameInformationCell.identifier
        ) as? SummonerGameInformationCell else {
            return UITableViewCell()
        }
        
        cell.setupContent(with: games[indexPath.row])
        
        if (indexPath.row + 1) == games.count {
            viewModel.fetchSummonerMatches(
                createDate: games.last?.createDate
            ) { [weak self] result in
                switch result {
                case .success(let matches):
                    DispatchQueue.main.async { [weak self] in
                        self?.games.append(contentsOf: matches.games)
                        self?.createdDate = matches.games.last?.createDate
                        self?.currentPage += 1
                        self?.summonerGameHisoryTableView.reloadData()
                    }
                case .failure(let error):
                    return
                }
            }
        }
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        
        return Design.tableViewHeightForRow
    }
}

// MARK: - Namespace

private enum Design {
    static let topViewAndSummaryScrollViewtopConstant: CGFloat = 24
    static let leagueSummaryScrollViewHeightConstant: CGFloat = 116
    static let recentGameAnalysisViewHeightConstant: CGFloat = 90
    static let tableViewNumberOfRowsInSection = 1
    static let tableViewHeightForRow: CGFloat = 104
    static let tableViewHeightForHeader: CGFloat = 2
}
