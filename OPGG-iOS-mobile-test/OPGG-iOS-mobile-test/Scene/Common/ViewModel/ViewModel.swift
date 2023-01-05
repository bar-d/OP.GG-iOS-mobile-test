//
//  ViewModel.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/06.
//

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    init(output: Output)
}
