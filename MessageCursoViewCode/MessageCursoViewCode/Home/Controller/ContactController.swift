//
//  ContactController.swift
//  MessageCursoViewCode
//
//  Created by Luan Arruda on 01/04/24.
//

import Foundation
import UIKit
import FirebaseFirestore

protocol ContactProtocol: AnyObject {
    func alertStateError(titulo: String, message: String)
    func sucessContact()
}

class ContactController {
    
    weak var delegate: ContactProtocol?
    
    public func delegate(delegate: ContactProtocol){
        self.delegate = delegate
    }
    
    func addContact(email: String, emailUsuarioLogado: String, idUsuario: String) {
        
        if email == emailUsuarioLogado {
            self.delegate?.alertStateError(titulo: "Você adicionou seu proprio e-mail", message: "Adiciona um e-mail diferente")
        }
        
        //verificar se existe o usuario no firebase
        
        let firestore = Firestore.firestore()
        firestore.collection("usuarios").whereField("email", isEqualTo: email).getDocuments { snapshotResult, error in
            
            // conta total de retorno
            if let totalItens = snapshotResult?.count {
                if totalItens == 0 {
                    self.delegate?.alertStateError(titulo: "Usuário não cadastrado", message: "Verifique o e-maile tente novamente")
                    return
                }
            }
            //salvar contato
            if let snapshot = snapshotResult {
                for document in snapshot.documents {
                    let dados = document.data()
                    self.saveContact(dadosContato: dados, idUsuario: idUsuario)
                }
            }
            
        }
    }
    
    func saveContact(dadosContato: Dictionary<String,Any>, idUsuario: String) {
        let contact: Contact = Contact(dicionario: dadosContato)
        let firestore = Firestore.firestore()
        firestore.collection("usuarios").document(idUsuario).collection("contatos").document(contact.id ?? "").setData(dadosContato) { error in
            if error == nil {
                self.delegate?.sucessContact()
            }
        }
    }
    
}
