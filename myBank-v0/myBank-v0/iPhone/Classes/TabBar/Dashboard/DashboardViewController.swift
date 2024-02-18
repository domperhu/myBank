//
//  DashboardViewController.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 18/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    private var dashboardView: DashboardView? { self.view as? DashboardView }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getInformation()
    }

    private func getInformation() {
        UserMock().GetUserMock { userResponse in
            self.dashboardView?.setInformationFrom(userResponse.toUser)
        }
    }
}
