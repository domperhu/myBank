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
}

extension SplashViewController: SplashViewDelegate {
    func splashViewFinishLottieAnimation(_ view: SplashView) {
        //TODO: do something here
        print(Configuration.envioronment.info.baseURL)
    }
}
