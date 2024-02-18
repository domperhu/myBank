//
//  SplashView.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 17/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit
import Lottie

protocol SplashViewDelegate: NSObjectProtocol {
    func splashViewFinishLottieAnimation(view: SplashView)
}

class SplashView: UIView {
    
    @IBOutlet private weak var animationView: LottieAnimationView!
    
    unowned var delegate: SplashViewDelegate?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.startAnimation()
    }
    
    private func startAnimation() {
        self.animationView.play { isFinish in
            isFinish ? self.delegate?.splashViewFinishLottieAnimation(view: self) : nil
        }
    }
}
