//
//  TableViewController.swift
//  ViewModelBindable_Example
//
//  Created by 방성원 on 2018. 4. 26..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit
import RxSwift
import ViewModelBindable

class TableViewController: UIViewController {
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - ViewModelBindable
extension TableViewController: ViewModelBindable {
   typealias ViewModel = TableViewModel

    func bindViewModel(viewModel: TableViewModel) {

    }
}
