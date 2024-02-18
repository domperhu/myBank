//
//  TabBarViewController.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 18/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setStyle()
        self.viewControllers = [DashboardViewController.build(), TransfersViewController.build()]
    }
    
    private func setStyle() {
        self.tabBar.layer.shadowColor       = UIColor.black.cgColor
        self.tabBar.layer.shadowOffset      = .zero
        self.tabBar.layer.shadowRadius      = 2.0
        self.tabBar.layer.shadowOpacity     = 0.5
        self.tabBar.layer.masksToBounds     = false
        self.tabBar.layer.borderWidth       = 0
        self.tabBar.layer.backgroundColor   = UIColor.white.cgColor
        self.tabBar.barTintColor            = .systemBlue
        self.tabBar.unselectedItemTintColor = .darkGray
        self.tabBar.isTranslucent           = false
        
        if #available(iOS 15.0, *) {
            
            let itemAppearance = UITabBarItemAppearance()
            itemAppearance.normal.iconColor     = .darkGray
            itemAppearance.selected.iconColor   = .systemBlue
            
            let appearance = UITabBarAppearance()
            appearance.backgroundColor          = .white
            appearance.stackedLayoutAppearance  = itemAppearance
            
            self.tabBar.standardAppearance = appearance
        }
    }
}



