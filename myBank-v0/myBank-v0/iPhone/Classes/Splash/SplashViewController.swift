//
//  SplashViewController.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 17/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    private var splashView: SplashView? { self.view as? SplashView }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.splashView?.delegate = self
    }
    
    private func goTo() {
        // TODO: Fix login
        // let controller = Memories.Onboarding.wasViewed() ? LoginViewController.build() : OnboardingViewController.build()
        self.navigationController?.pushViewController(TabBarViewController.build(), animated: true)
    }
}

extension SplashViewController: SplashViewDelegate {
    func splashViewFinishLottieAnimation(view: SplashView) {
        self.goTo()
    }
}
