//
//  MessageAllModel.swift
//  MessageCursoViewCode
//
//  Created by Luan Arruda on 01/04/24.
//

import Foundation

class Message {
    var text: String
    var idUser: String
    
    init(dicionario: [String:Any]) {
        self.text = dicionario["text"] as? String ?? ""
        self.idUser = dicionario["idUser"] as? String ?? "Anônimo"
    }
    
}

class Conversation {
    var name: String?
    var lastMessage: String?
    var idDestinatario: String?
    
    init(dicionario: [String:Any]) {
        self.name = dicionario["text"] as? String ?? ""
        self.lastMessage = dicionario["idUser"] as? String ?? "Anônimo"
        self.lastMessage = dicionario["idDestinatario"] as? String ?? "Anônimo"
    }
}

class User {
    var name: String?
    var email: String?
    
    init(dicionario: [String:Any]) {
        self.name = dicionario["name"] as? String ?? ""
        self.email = dicionario["email"] as? String ?? ""
    }
}

class Contact {
    var name: String?
    var id: String?
    
    init(dicionario: [String:Any]?) {
        self.name = dicionario?["name"] as? String ?? ""
        self.id = dicionario?["id"] as? String ?? ""
    }
    
    convenience init(name: String?, id: String?) {
        self.init(dicionario: nil)
        self.name = name
        self.id = id
    }
}

