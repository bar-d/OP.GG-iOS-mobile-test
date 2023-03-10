//
//  LeagueSummaryScrollView.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/03.
//

import UIKit

final class LeagueSummaryScrollView: UIScrollView {
    
    // MARK: Properties
    
    private let soloRankSummaryView = LeagueSummaryView(with: .solo)
    private let flexRankSummaryView = LeagueSummaryView(with: .flex)
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = Design.horizontalStackViewSpacing
        
        return stackView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Methods
    
    func setupContent(with leagues: [Summoner.League]) {
        if leagues.isEmpty || leagues.count > 2 {
            return
        }
        
        soloRankSummaryView.setupContent(with: leagues[0])
        flexRankSummaryView.setupContent(with: leagues[1])
    }
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupHorizontalStackViewConstraints()
        setupLeagueSummaryScrollView()
        setupContentInset(
            top: Design.contentInsetTopAndBottom,
            left: Design.contentInsetLeftAndRight,
            bottom: Design.contentInsetTopAndBottom,
            right: Design.contentInsetLeftAndRight
        )
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [soloRankSummaryView, flexRankSummaryView]
            .forEach { horizontalStackView.addArrangedSubview($0) }
        [horizontalStackView]
            .forEach { addSubview($0) }
    }
    
    private func setupHorizontalStackViewConstraints() {
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(
                equalTo: topAnchor
            ),
            horizontalStackView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Design.horizontalStackViewBottomConstant
            ),
            horizontalStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor
            ),
            horizontalStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor
            )
        ])
    }
    
    private func setupLeagueSummaryScrollView() {
        showsHorizontalScrollIndicator = false
    }
    
    private func setupContentInset(
        top: CGFloat,
        left: CGFloat,
        bottom: CGFloat,
        right: CGFloat
    ) {
        contentInset = UIEdgeInsets(
            top: top,
            left: left,
            bottom: bottom,
            right: right
        )
    }
}

// MARK: - Namespace

private enum Design {
    static let horizontalStackViewSpacing: CGFloat = 8
    static let contentInsetTopAndBottom: CGFloat = 0
    static let contentInsetLeftAndRight: CGFloat = 16
    static let horizontalStackViewBottomConstant: CGFloat = -16
}
