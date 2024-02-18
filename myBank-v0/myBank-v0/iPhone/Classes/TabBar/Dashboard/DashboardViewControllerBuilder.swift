//
//  DashboardViewControllerBuilder.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 18/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

extension DashboardViewController {
    class func build() -> Self {
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "DashboardViewController") as? Self else { return Self() }
        viewController.tabBarItem.image = UIImage(systemName: "star.fill")
        viewController.tabBarItem.title = "Dashboard"
        return viewController
    }
}

