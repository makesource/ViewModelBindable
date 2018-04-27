//
//  TableViewController.swift
//  ViewModelBindable_Example
//
//  Created by 방성원 on 2018. 4. 26..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import ViewModelBindable

class TableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "LabelTableViewCell", bundle: nil), forCellReuseIdentifier: "LabelTableViewCell")
    }
}

// MARK: - ViewModelBindable
extension TableViewController: ViewModelBindable {
   typealias ViewModel = TableViewModel

    func bindViewModel(viewModel: ViewModel) {
        // ViewModel Inputs
        addBarButton.rx.tap
            .bind(to: viewModel.addButtonClicked)
            .disposed(by: disposeBag)

        // ViewModel Outputs
        let dataSource = configureDataSource(viewModel: viewModel)
        viewModel.dataSources
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }

    private func configureDataSource(viewModel: ViewModel) -> RxTableViewSectionedReloadDataSource<SectionModel<String, String>> {
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, String>>(
            configureCell: { (_, tv, ip, text: String) in
                let cell: LabelTableViewCell = tv.dequeueReusableCell(withIdentifier: "LabelTableViewCell", for: ip) as! LabelTableViewCell
                cell.viewModel = LabelTableCellViewModel(text)
                return cell
            }
        )
        return dataSource
    }
}
