//
//  MainViewController.swift
//  ViewModelBindable
//
//  Created by makesource on 04/16/2018.
//  Copyright (c) 2018 makesource. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ViewModelBindable

class MainViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!

    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension MainViewController: ViewModelBindable {
    typealias ViewModel = MainViewModel

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
}

