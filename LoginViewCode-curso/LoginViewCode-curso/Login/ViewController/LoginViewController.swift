//
//  ViewController.swift
//  LoginViewCode-curso
//
//  Created by Luan Arruda on 05/03/24.
//

import UIKit

class LoginViewController: UIViewController {
    
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

extension LoginViewController: UITextFieldDelegate {
    
    private func configTextFiedl(tf: UITextField){
        if tf.placeholder == "Digite seu e-mail"{
            tf.resignFirstResponder()
            loginScreen?.passwordTextField.becomeFirstResponder()
        }
        tf.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.configTextFiedl(tf: textField)
        return true
    }
    
}

extension LoginViewController: LoginScreenProtocol {
    func actionLoginButton() {
        print("login vc")
    }
    
    func actionRegisterButton() {
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

