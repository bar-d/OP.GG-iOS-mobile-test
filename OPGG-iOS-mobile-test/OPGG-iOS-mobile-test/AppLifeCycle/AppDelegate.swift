//
//  AppDelegate.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/03.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: Properties
    
    var window: UIWindow?
    
    // MARK: - Methods
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [
            UIApplication.LaunchOptionsKey: Any
        ]?
    ) -> Bool {
        let viewModel = SummoneGameHistoryViewModel()
        let summonerGameHistoryViewController = SummonerGameHistoryViewController(
            viewModel: viewModel
        )
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = summonerGameHistoryViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}
