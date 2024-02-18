//
//  OnboardingView.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 17/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

protocol OnboardingViewDelegate: NSObjectProtocol {
    func onboardingDidTapBtnDone(view: OnboardingView)
}

class OnboardingView: UIView {
    
    unowned var delegate: OnboardingViewDelegate?
    
    @IBAction private func tabBtnDone(_ sender: Any) {
        self.delegate?.onboardingDidTapBtnDone(view: self)
    }
}
