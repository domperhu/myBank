//
//  OffersViewControllerBuilder.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 19/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

extension OffersViewController {
    class func build() -> Self {
        let storyboard = UIStoryboard(name: "Offers", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "OffersViewController") as? Self else { return Self() }
        viewController.tabBarItem.image = UIImage(systemName: "bag")
        viewController.tabBarItem.title = "Offers"
        return viewController
    }
}
