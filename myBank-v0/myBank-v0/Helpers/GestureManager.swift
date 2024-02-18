//
//  GestureManager.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 18/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

extension UIViewController {
    @IBAction public func tabToHideKeyboard(_ gesture: UIGestureRecognizer) {
        self.view.endEditing(true)
    }
}
