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
    }
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }

}
