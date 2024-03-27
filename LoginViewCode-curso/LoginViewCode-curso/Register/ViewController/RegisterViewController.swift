//
//  RegisterViewController.swift
//  LoginViewCode-curso
//
//  Created by Luan Arruda on 11/03/24.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    var registerScreen: RegisterScreen?
    var auth: Auth?
    var firestore: Firestore?
    var alert: Alert?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.configTextFieldDelegate(delegate: self)
        registerScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.firestore = Firestore.firestore()
        self.alert = Alert(controller: self)
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
        
        guard let register = self.registerScreen else {return}
        
        let name = register.getName()
        let email = register.getEmail()
        let password = register.getPassword()
        
        self.auth?.createUser(withEmail: email, password: password, completion: { result, error in
            
            if error != nil {
                self.alert?.getAlert(titulo: "Atenção", mensagem: "Erro ao cadastrar, tente novamente.")
            }else {
                
                // Salvar dados no firebase
                
                if let idUsuario = result?.user.uid {
                    self.firestore?.collection("usuarios").document(idUsuario).setData([
                        "nome": name,
                        "email": email,
                        "id": idUsuario
                    ])
                }
                
                self.alert?.getAlert(titulo: "Parabens", mensagem: "Usuário cadastrado com sucesso!", completion: {
                    let vc = HomeViewController()
                    let navVC = UINavigationController(rootViewController: vc)
                    navVC.modalPresentationStyle = .fullScreen
                    self.present(navVC, animated: true)
                })
            }
            
        })
        
        
    }
    
    
}
