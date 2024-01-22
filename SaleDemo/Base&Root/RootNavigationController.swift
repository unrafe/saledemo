//
//  RootNavigationController.swift
//  SaleDemo
//
//  Created by UnRafe on 19/1/2567 BE.
//  Copyright © 2567 BE Nuttawut. All rights reserved.
//

import UIKit

class RootNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.isNavigationBarHidden = true
        self.interactivePopGestureRecognizer?.isEnabled = true
        setNeedsStatusBarAppearanceUpdate()
    }
}
