//
//  LabelTableViewCell.swift
//  ViewModelBindable_Example
//
//  Created by 방성원 on 2018. 4. 26..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ViewModelBindable

class LabelTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    var disposeBag = DisposeBag()
}

extension LabelTableViewCell: ViewModelBindable {
    typealias ViewModel = LabelTableCellViewModel

    func bindViewModel(viewModel: ViewModel) {
        viewModel.text
            .drive(label.rx.text)
            .disposed(by: disposeBag)
    }
}

