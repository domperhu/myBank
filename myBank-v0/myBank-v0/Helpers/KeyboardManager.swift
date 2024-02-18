//
//  KeyboardManager.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 18/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

protocol WBKeyboardManagerDelegate: NSObjectProtocol {
    func keyboardManager(_ manager: KeyboardManager, willShow information: KeyboardManager.Information)
    func keyboardManager(_ manager: KeyboardManager, willHide information: KeyboardManager.Information)
}

class KeyboardManager {
    
    private weak var delegate: WBKeyboardManagerDelegate?
    
    init(delegate: WBKeyboardManagerDelegate) {
        self.delegate = delegate
    }
    
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    func unregisterKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        let information = Information(info: notification.userInfo)
        self.delegate?.keyboardManager(self, willShow: information)
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        let information = Information(info: notification.userInfo)
        self.delegate?.keyboardManager(self, willHide: information)
    }
}

extension KeyboardManager {
    struct Information {
        let animationDuration   : Double
        let size                : CGSize
        let origin              : CGPoint
        
        init(info: [AnyHashable: Any]?) {
            self.animationDuration  = info?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? .zero
            let keyboardFrame       = info?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
            self.size               = keyboardFrame.size
            self.origin             = keyboardFrame.origin
        }
    }
}

