//
//  TabBarViewControllerBuilder.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 18/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

extension TabBarViewController {
    class func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TabBarViewController")
        viewController.navigationItem.hidesBackButton = true
        return viewController
    }
}

