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

    func bindViewModel(viewModel: ViewModel) {
        addBarButton.rx.tap
            .bind(to: viewModel.addButtonClicked)
            .disposed(by: disposeBag)

        let dataSource = configureDataSource(viewModel: viewModel)
        viewModel.dataSources
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }

    private func configureDataSource(viewModel: ViewModel) -> RxTableViewSectionedReloadDataSource<SectionModel<String, String>> {
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, String>>(
            configureCell: { (_, tv, ip, text: String) in
                return UITableViewCell()
//                switch model {
//                case .webtoon(let webtoon):
//                    let cell: WebtoonRankingTableViewCell = tv.dequeueReusableCell(forIndexPath: ip)
//                    let ranking = ip.row > 3 && hasInterstitial ? ip.row : ip.row + 1
//                    cell.configure(webtoon, ranking: ranking)
//                    return cell
//                case .interstitial:
//                    let cell: InterstitialTableViewCell = tv.dequeueReusableCell(forIndexPath: ip)
//                    cell.configure(bannerView: bannerView)
//                    return cell
//                }
            }
        )
        return dataSource
    }
}
