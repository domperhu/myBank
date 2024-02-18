//
//  LoginViewController.swift
//  myBank-v0
//
//  Created by Dominique Perez Huaman on 17/02/24.
//  Copyright © 2024 My Bank. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var loginView: LoginView? { self.view as? LoginView }
    private lazy var keyboardManager = KeyboardManager(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView?.delegate = self
        self.loginView?.loginButtonIsEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.keyboardManager.registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.keyboardManager.unregisterKeyboardNotifications()
    }
    
    private func validateLogin(_ accountNumber: String, andCrown crown: String) {
        self.navigationController?.pushViewController(TabBarViewController.build(), animated: true)
    }
}

extension LoginViewController: LoginViewDelegate {
    func loginView(view: LoginView, doLoginWithAccountNumber accountNumber: String?, andCrown crown: String?) {
        self.validateLogin(accountNumber ?? "", andCrown: crown ?? "")
    }
    
    func loginView(view: LoginView, formIsComplete isComplete: Bool) {
        self.loginView?.loginButtonIsEnabled = isComplete
    }
}

extension LoginViewController: WBKeyboardManagerDelegate {
    func keyboardManager(_ manager: KeyboardManager, willShow information: KeyboardManager.Information) {
        self.loginView?.keyboardShow(information)
    }
    
    func keyboardManager(_ manager: KeyboardManager, willHide information: KeyboardManager.Information) {
        self.loginView?.keyboardHide(information)
    }
}
