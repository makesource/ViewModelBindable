//
//  LabelViewController.swift
//  ViewModelBindable
//
//  Created by makesource on 04/16/2018.
//  Copyright (c) 2018 makesource. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ViewModelBindable

class LabelViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!

    var disposeBag = DisposeBag()
}

extension LabelViewController: ViewModelBindable {
    typealias ViewModel = LabelViewModel

    func bindViewModel(viewModel: ViewModel) {
        // ViewModel Inputs
        button.rx.tap
            .bind(to: viewModel.input)
            .disposed(by: disposeBag)

        // ViewModel Outputs
        viewModel.text
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
    }

    func bindStyles() {
        button.tintColor = .red
    }
}

