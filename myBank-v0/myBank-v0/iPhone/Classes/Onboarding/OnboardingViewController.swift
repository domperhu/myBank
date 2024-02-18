//
//  OnboardingViewController.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 17/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
 
    private var onboardingView: OnboardingView? { self.view as? OnboardingView }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.onboardingView?.delegate = self
    }
}

extension OnboardingViewController: OnboardingViewDelegate {
    func onboardingDidTapBtnDone(view: OnboardingView) {
        Memories.Onboarding.setViewed()
        self.navigationController?.pushViewController(LoginViewController.build(), animated: true)
    }
}
