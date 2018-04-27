//
//  LabelTableCellViewModel.swift
//  ViewModelBindable_Example
//
//  Created by 방성원 on 2018. 4. 27..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class LabelTableCellViewModel {
    let text: Driver<String>

    init(_ text: String) {
        self.text = Driver.just(text)
    }
}
