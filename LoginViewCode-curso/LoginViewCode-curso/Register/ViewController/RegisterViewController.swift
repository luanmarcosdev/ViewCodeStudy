//
//  RegisterViewController.swift
//  LoginViewCode-curso
//
//  Created by Luan Arruda on 11/03/24.
//

import UIKit

class RegisterViewController: UIViewController {

    var registerScreen: RegisterScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.configTextFieldDelegate(delegate: self)
        registerScreen?.delegate(delegate: self)
    }
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }

}

extension RegisterViewController: UITextFieldDelegate {
    
    private func configTextFiedl(tf: UITextField){
        if tf.placeholder == "Digite seu e-mail"{
            tf.resignFirstResponder()
            registerScreen?.passwordTextField.becomeFirstResponder()
        }
        tf.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.configTextFiedl(tf: textField)
        return true
    }
}

extension RegisterViewController: RegisterScreenProtocol {
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        print("registrar protocol")
    }
    
    
}
