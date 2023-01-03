//
//  SummonerGameHistoryViewController.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/03.
//

import UIKit

final class SummonerGameHistoryViewController: UIViewController {

    // MARK: Properties
    
    private let topView = TopView()
    private let leagueSummaryScrollView = LeagueSummaryScrollView()
    
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
    }
    
    private func setupBackgroundColor(_ color: UIColor?) {
        view.backgroundColor = color
    }
    
    private func setupSubviews() {
        [topView, leagueSummaryScrollView]
            .forEach { view.addSubview($0) }
    }
    
    private func setupConstraints() {
        setupTopViewConstraints()
        setupLeagueSummaryViewConstraints()
    }
    
    private func setupTopViewConstraints() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 24),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupLeagueSummaryViewConstraints() {
        NSLayoutConstraint.activate([
            leagueSummaryScrollView.topAnchor.constraint(
                equalTo: topView.bottomAnchor,
                constant: 24
            ),
            leagueSummaryScrollView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            leagueSummaryScrollView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            leagueSummaryScrollView.heightAnchor.constraint(
                equalToConstant: 100
            )
        ])
    }
}
