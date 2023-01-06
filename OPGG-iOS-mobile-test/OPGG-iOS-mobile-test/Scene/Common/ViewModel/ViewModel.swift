//
//  ViewModel.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/06.
//

import RxSwift

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    var disposeBag: DisposeBag { get set }
    
    func transfrom(input: Input) -> Output
}
