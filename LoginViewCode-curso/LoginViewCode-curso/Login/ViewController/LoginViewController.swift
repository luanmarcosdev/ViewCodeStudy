//
//  ViewController.swift
//  LoginViewCode-curso
//
//  Created by Luan Arruda on 05/03/24.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    var loginScreen: LoginScreen?
    var auth: Auth?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.loginScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
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
        
        guard let login = self.loginScreen else {return}
        
        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { user, error in
            
            if error != nil {
                print("E-mail ou senha invalidos.")
            }else {
                if user == nil {
                    print("Tivemos um problema inesperado, tente novamente mais tarde")
                }else {
                    print("Usuário logado com sucesso!")
                }
            }
            
        })
        
        
        
        
    }
    
    func actionRegisterButton() {
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

