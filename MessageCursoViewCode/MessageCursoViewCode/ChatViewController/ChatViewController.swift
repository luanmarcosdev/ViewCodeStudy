//
//  ChatViewController.swift
//  MessageCursoViewCode
//
//  Created by Luan Arruda on 02/04/24.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    var screen: ChatViewScreen?
    
    override func loadView() {
        self.screen = ChatViewScreen()
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @objc
    func tappedBackButton () {
        self.navigationController?.popToRootViewController(animated: true)
    }
    

   

}
