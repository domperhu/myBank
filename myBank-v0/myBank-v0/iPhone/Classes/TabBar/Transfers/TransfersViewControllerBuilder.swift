//
//  TransfersViewControllerBuilder.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 18/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

extension TransfersViewController {
    class func build() -> Self {
        let storyboard = UIStoryboard(name: "Transfers", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "TransfersViewController") as? Self else { return Self() }
        viewController.tabBarItem.image = UIImage(systemName: "rectangle.and.pencil.and.ellipsis")
        viewController.tabBarItem.title = "Transfers"
        return viewController
    }
}

