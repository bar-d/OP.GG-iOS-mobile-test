//
//  SummonerGameHistoryViewController.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/03.
//

import UIKit

final class SummonerGameHistoryViewController: UIViewController {

    // MARK: Properties
    
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
}

extension SummonerGameHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        
        return Design.tableViewNumberOfRowsInSection
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 10
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
        
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        
        return Design.tableViewHeightForRow
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        
        return Design.tableViewHeightForHeader
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
