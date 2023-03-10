//
//  SummonerGameHistoryViewController.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/03.
//

import UIKit

final class SummonerGameHistoryViewController: UIViewController {

    // MARK: Properties
    
    private var games: [Matches.Game] = [] {
        didSet {
            summonerGameHisoryTableView.reloadData()
        }
    }
    
    private weak var refreshButtonDelegate: RefreshButtonDelegate?
    private let summonerGameHisoryTableView = SummonerGameHistoryTableView()
    
    private lazy var viewModel = SummonerGameHistoryViewModel(
        output: .init(
            fetchSummoner: setupHeaderView(with:),
            fetchMatches: setupHeaderView(with:),
            fetchGames: setupCell(with:),
            errorOccured: presentAlertController(_:)
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
        summonerGameHisoryTableView.setupRefreshButtonDelegate(self)
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
    
    private func setupHeaderView(with summoner: Summoner) {
        DispatchQueue.main.async { [weak self] in
            self?.summonerGameHisoryTableView.setupHeaderView(with: summoner)
        }
    }
    
    private func setupHeaderView(with matches: Matches) {
        DispatchQueue.main.async { [weak self] in
            self?.games = matches.games
            self?.summonerGameHisoryTableView.setupHeaderView(with: matches)
        }
    }
    
    private func setupCell(with games: [Matches.Game]) {
        DispatchQueue.main.async { [weak self] in
            self?.games.append(contentsOf: games)
        }
    }
    
    private func presentAlertController(_ error: Error) {
        let alertController = UIAlertController(
            title: "????????? ??????????????????.",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: "??????", style: .default)
        
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    private func setupRefreshGameHistoryButton() {
        refreshButtonDelegate?.refreshGameHistoryButtonDidTap()
    }
}

extension SummonerGameHistoryViewController: RefreshButtonDelegate {
    func refreshGameHistoryButtonDidTap() {
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
    static let summonerAlertTitle = "????????? ????????? ??????????????? ?????????????????????"
    static let matchesAlertTitle = "????????? ?????? ????????? ??????????????? ?????????????????????"
}
