//
//  ViewController.swift
//  LoginViewCode-curso
//
//  Created by Luan Arruda on 05/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.loginScreen?.delegate(delegate: self)
    }
 
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.placeholder == "Digite seu e-mail"{
            textField.resignFirstResponder()
            loginScreen?.passwordTextField.becomeFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }
    
}

extension ViewController: LoginScreenProtocol {
    func actionLoginButton() {
        print("login vc")
    }
    
    func actionRegisterButton() {
        print("register vc")
    }
    
}

