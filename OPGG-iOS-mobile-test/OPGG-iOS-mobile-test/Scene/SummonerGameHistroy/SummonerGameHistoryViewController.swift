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
    private let summonerGameHisoryTableView = SummonerGameHistoryTableView()
    
    private lazy var viewModel = SummonerGameHistoryViewModel(
        output: .init(
            fetchSummoner: setupHeaderViewWithSummoner(_:),
            fetchMatches: setupHeaderViewWithMatches(_:),
            fetchGames: setupCellWithGames(_:)
        )
    )
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonInit()
    }
    
    // MARK: - Methods
    
    private func commonInit() {
        viewModel.input.appDidStart()
        setupBackgroundColor(.paleGrey)
        setupSubviews()
        setupConstraints()
        setupTableView()
        setupRefreshGameHistoryButton()
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
    
    private func setupHeaderViewWithSummoner(_ summoner: Summoner) {
        DispatchQueue.main.async { [weak self] in
            self?.summonerGameHisoryTableView.setupHeaderView(with: summoner)
        }
    }
    
    private func setupHeaderViewWithMatches(_ matches: Matches) {
        DispatchQueue.main.async { [weak self] in
            self?.games = matches.games
            self?.summonerGameHisoryTableView.setupHeaderView(with: matches)
            self?.summonerGameHisoryTableView.reloadData()
        }
    }
    
    private func setupCellWithGames(_ games: [Matches.Game]) {
        DispatchQueue.main.async { [weak self] in
            self?.games.append(contentsOf: games)
            self?.summonerGameHisoryTableView.reloadData()
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
        viewModel.input.refreshButtonDidTap()
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
        
        var currentPage = 1

        if (indexPath.row + 1) == games.count {
            viewModel.input.updateGames()
            currentPage += 1
        }
        
        cell.setupContent(with: games[indexPath.row])
        
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
    static let summonerAlertTitle = "소환사 정보를 가져오는데 실패하였습니다"
    static let matchesAlertTitle = "소환사 게임 정보를 가져오는데 실패하였습니다"
}
