//
//  LoginView.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 17/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: NSObjectProtocol {
    func loginView(view: LoginView, doLoginWithAccountNumber accountNumber: String?, andCrown crown: String?)
    func loginView(view: LoginView, formIsComplete isComplete: Bool)
}

class LoginView: UIView {
    
    @IBOutlet private weak var anchorBottomContent  : NSLayoutConstraint!
    @IBOutlet private weak var txtAccountNumber     : UITextField!
    @IBOutlet private weak var txtAccountCrown      : UITextField!
    @IBOutlet private weak var btnLogin             : UIButton!
    
    var loginButtonIsEnabled: Bool {
        get { self.btnLogin.isEnabled }
        set { self.btnLogin.isEnabled = newValue }
    }
    
    unowned var delegate: LoginViewDelegate?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.setGradientBackground()
        self.txtAccountNumber.addTarget(self, action: #selector(textDidChange(_ :)), for: .editingChanged)
        self.txtAccountCrown.addTarget(self, action: #selector(textDidChange(_ :)), for: .editingChanged)
    }
    
    @IBAction private func tabBtnLogin(_ sender: Any) {
        self.delegate?.loginView(view: self, doLoginWithAccountNumber: self.txtAccountNumber.text, andCrown: self.txtAccountCrown.text)
    }
    
    func keyboardShow(_ information: KeyboardManager.Information) {
        UIView.animate(withDuration: information.animationDuration, delay: 0, options: .curveEaseInOut, animations: {
            self.anchorBottomContent.constant = information.size.height - self.safeAreaInsets.bottom + 8
            self.layoutIfNeeded()
        }, completion: nil)
    }
     
    func keyboardHide(_ information: KeyboardManager.Information) {
        UIView.animate(withDuration: information.animationDuration) {
            self.anchorBottomContent.constant = 8
            self.layoutIfNeeded()
        }
    }
    
    private func setGradientBackground() {
        let gradient        = CAGradientLayer()
        gradient.colors     = [UIColor.white.cgColor, UIColor.lightGray.cgColor]
        gradient.locations  = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint   = CGPoint(x: 1.0, y: 1.0)
        gradient.frame      = self.frame
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    @objc private func textDidChange(_ textField: UITextField) {
        let isComplete = self.txtAccountNumber.text?.count != 0  && self.txtAccountCrown.text?.count ?? 0 >= 6
        self.delegate?.loginView(view: self, formIsComplete: isComplete)
    }
}
