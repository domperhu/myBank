//
//  DashboardView.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 18/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

class DashboardView: UIView {
    
    @IBOutlet private weak var btnProfile   : UIButton!
    @IBOutlet private weak var lblFullName  : UILabel!
    @IBOutlet private weak var lblEmail     : UILabel!
    
    func setInformationFrom(_ user: User) {
        self.btnProfile.imageView?.downloadImageWithThis("https://bit.ly/4bIE4m3", awaitImage: UIImage(systemName: "person.circle"))
        self.lblFullName.text   = user.fullname
        self.lblEmail.text      = user.email.toSecureEmail()
    }
}
