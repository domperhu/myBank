//
//  LoginViewControllerBuilder.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 17/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

extension LoginViewController {
    class func build() -> Self {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? Self else { return Self() }
        viewController.navigationItem.hidesBackButton = true
        return viewController
    }
}
