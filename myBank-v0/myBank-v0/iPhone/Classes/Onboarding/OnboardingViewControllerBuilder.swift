//
//  OnboardingViewControllerBuilder.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 17/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

extension OnboardingViewController {
    class func build() -> Self {
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "OnboardingViewController") as? Self else { return Self() }
        viewController.navigationItem.hidesBackButton = true
        return viewController
    }
}
