//
//  MainViewModel.swift
//  ViewModelBindable_Example
//
//  Created by 방성원 on 2018. 4. 17..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import Foundation
import RxSwift

final class MainViewModel {
    // input
    let input = PublishSubject<Void>()

    // output
    let text: Observable<String>

    init() {
        text = input.asObservable()
            .map { 1 }
            .scan(0) { $0 + $1 }
            .startWith(0)
            .map { "\($0)" }
    }
}
