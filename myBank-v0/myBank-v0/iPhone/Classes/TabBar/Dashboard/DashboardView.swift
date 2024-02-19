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
    @IBOutlet private weak var lblAccount   : UILabel!
    
    func setInformationFrom(_ user: User) {
        self.lblFullName.text   = user.fullname
        self.lblAccount.text    = user.account.toSecureText()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.btnProfile.layer.cornerRadius = 0.5 * btnProfile.frame.size.width
        //self.btnProfile.setImage(UIImage(systemName: "person.circle"), for: .normal)
        self.btnProfile.imageView?.downloadImageWithThis("https://bit.ly/4bIE4m3", awaitImage: UIImage(systemName: "person.circle"))

    }
    
    
    @IBAction private func clickBtnProfile(_ sender: UIButton) {
        
    }
    
}
