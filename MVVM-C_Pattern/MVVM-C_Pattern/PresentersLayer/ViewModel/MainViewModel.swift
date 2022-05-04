//
//  MainViewModel.swift
//  MVVM-C_Pattern
//
//  Created by Kim dohyun on 2022/05/04.
//

import Foundation
import RxCocoa

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    var input: Input {get set}
    var output: Output {get set}
}


class MainViewModel: ViewModelType {

    struct Input {
        
    }
    
    struct Output {
        public var nextButtonDidTap: PublishRelay<Void> = PublishRelay<Void>()
    }
    
    var input: Input = Input()
    var output: Output = Output()

    
}
