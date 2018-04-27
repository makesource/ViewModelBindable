//
//  TableViewModel.swift
//  ViewModelBindable_Example
//
//  Created by 방성원 on 2018. 4. 26..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

final class TableViewModel {
    // inputs
    let addButtonClicked: PublishSubject<Void>

    // outputs
    let dataSources: Observable<[SectionModel<String, String>]>

    init() {
        self.addButtonClicked = PublishSubject()

        let numberObservable = addButtonClicked
            .map { 1 }
            .scan(0) { $0 + $1 }
            .map { "\($0)-th item" }

        let items = numberObservable
            .map { [$0] }
            .scan([]) { $0 + $1 }

        self.dataSources = items
            .map { [SectionModel(model: "cells", items: $0)] }
    }
}
