//
//  SplashViewControllerBuilder.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 17/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

extension SplashViewController {
    
    class func build() -> Self {
        let storyboard = UIStoryboard(name: "Splash", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as? Self else { return Self() }
        return viewController
    }
}
