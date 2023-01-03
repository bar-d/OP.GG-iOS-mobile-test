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
        [topView]
            .forEach { view.addSubview($0) }
    }
    
    private func setupConstraints() {
        setupTopViewConstraints()
    }
    
    private func setupTopViewConstraints() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
