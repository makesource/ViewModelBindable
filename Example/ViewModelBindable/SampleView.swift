//
//  SampleView.swift
//  ViewModelBindable_Example
//
//  Created by 방성원 on 2018. 4. 23..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import Foundation
import RxSwift
import ViewModelBindable

class SampleView: UIView {
    @IBOutlet weak var button: UIButton!
    var disposeBag = DisposeBag()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.common()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.common()
    }

    func common() {
        let contentView = Bundle.main.loadNibNamed("SampleView", owner: self, options: nil)!.first as! UIView
        contentView.frame = self.bounds
        addSubview(contentView)
    }
}

extension SampleView: ViewModelBindable {
    typealias ViewModel = Any

    override func awakeFromNib() {
        super.awakeFromNib()
        print("TEST!!! awakefromNib2")
    }

    func bindViewModel(viewModel: ViewModel) {
        print("TEST!!! bindViewModel2")
        button.rx.tap.subscribe().disposed(by: disposeBag)
    }
}
