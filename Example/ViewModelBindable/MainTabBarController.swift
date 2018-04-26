//
//  MainTabBarController.swift
//  ViewModelBindable_Example
//
//  Created by 방성원 on 2018. 4. 26..
//  Copyright © 2018년 CocoaPods. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers?.forEach {
            if let vc = $0 as? LabelViewController {
                vc.viewModel = LabelViewModel()
            } else if let vc = $0 as? TableViewController {
                vc.viewModel = TableViewModel()
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
