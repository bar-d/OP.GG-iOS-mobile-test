//
//  SummonerGameHistoryTableView.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/04.
//

import UIKit

final class SummonerGameHistoryTableView: UITableView {
    
    // MARK: Properties
    
    private let summonerGameHistoryTableHeaderView = SummonerGameHistoryTableHeaderView()
    
    // MARK: Initializers
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .grouped)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Mehtods
    
    func getRefreshGameHistoryButton() -> UIButton {
        return summonerGameHistoryTableHeaderView.getRefreshGameHistoryButton()
    }

    
    func setupDelegate(_ delegate: UITableViewDelegate) {
        self.delegate = delegate
    }
    
    func setupDataSource(_ dataSource: UITableViewDataSource) {
        self.dataSource = dataSource
    }
    
    func setupHeaderView(with summoner: Summoner) {
        summonerGameHistoryTableHeaderView.setupContent(with: summoner)
    }
    
    func setupHeaderView(with matches: Matches) {
        summonerGameHistoryTableHeaderView.setupContent(with: matches)
    }
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupBackgroundColor(.paleGrey2)
        setupHeaderView()
        setupHeaderViewConstraints()
        setupSeparatorStyle(.none)
        setupScrollIndicator()
        setupCell()
        setupSectionHeaderAndFooterHeight(header: .zero, footer: Design.footerHeight)
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupBackgroundColor(_ color: UIColor?) {
        backgroundColor = color
    }
    
    private func setupHeaderView() {
        addSubview(summonerGameHistoryTableHeaderView)
        tableHeaderView = summonerGameHistoryTableHeaderView
    }
    
    private func setupHeaderViewConstraints() {
        tableHeaderView?.frame = CGRect(
            x: .zero,
            y: .zero,
            width: frame.size.width,
            height: Design.summonerGameHistoryTableHeaderViewHeightConstant
        )
        
        NSLayoutConstraint.activate([
            summonerGameHistoryTableHeaderView.heightAnchor.constraint(
                equalToConstant: Design.summonerGameHistoryTableHeaderViewHeightConstant
            ),
            summonerGameHistoryTableHeaderView.widthAnchor.constraint(
                equalTo: widthAnchor
            ),
            summonerGameHistoryTableHeaderView.centerXAnchor.constraint(
                equalTo: centerXAnchor
            ),
            summonerGameHistoryTableHeaderView.topAnchor.constraint(
                equalTo: topAnchor
            )
        ])
    }
    
    private func setupSeparatorStyle(_ style: UITableViewCell.SeparatorStyle) {
        separatorStyle = style
    }
    
    private func setupScrollIndicator(vertical: Bool = false, horizontal: Bool = false) {
        showsVerticalScrollIndicator = vertical
        showsHorizontalScrollIndicator = horizontal
    }
    
    private func setupCell() {
        register(
            SummonerGameInformationCell.self,
            forCellReuseIdentifier: SummonerGameInformationCell.identifier
        )
    }
    
    private func setupSectionHeaderAndFooterHeight(header: CGFloat, footer: CGFloat) {
        sectionHeaderHeight = header
        sectionFooterHeight = footer
    }
}

// MARK: - Namespace

private enum Design {
    static let footerHeight: CGFloat = 4
    static let summonerGameHistoryTableHeaderViewHeightConstant: CGFloat = 346
}
