//
//  HomeViewController.swift
//  MessageCursoViewCode
//
//  Created by Luan Arruda on 27/03/24.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    var auth: Auth?
    var db: Firestore?
    var idUserOn: String?
    
    var screenContact: Bool?
    var emailUserOn: String?
    var alert: Alert?
    
    var screen: HomeScreen?
    
    var contact: ContactController?
    var listContact: [Contact] = []
    var listConversation: [Conversation] = []
    var conversasListener: ListenerRegistration?
    
    override func loadView() {
        self.screen = HomeScreen()
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = CustomColor.appLight
        self.configHomeView()
        self.configCollectionView()
        self.configAlert()
        self.configIdentifierFirebase()
        self.addListenerRecuperarConversa()
    }
    
    private func configHomeView(){
        self.screen?.navView.delegate(delegate: self)
    }
    
    private func configCollectionView(){
        self.screen?.delegateCollectionView(delegate: self, dataSource: self)
    }
    
    private func configAlert(){
        self.alert = Alert(controller: self)
    }
    
    private func configIdentifierFirebase(){
        self.auth = Auth.auth()
        self.db = Firestore.firestore()
        
        //recuperar id usuario logado
        
        if let currentUser = auth?.currentUser {
            self.idUserOn = currentUser.uid
            self.emailUserOn = currentUser.email
        }
    }
    
    private func configContact(){
        self.contact = ContactController()
        self.contact?.delegate(delegate: self)
    }
    
    func addListenerRecuperarConversa(){
        if let idUserOn = auth?.currentUser?.uid {
            self.conversasListener = db?.collection("conversas").document(idUserOn).collection("ultimas_conversas").addSnapshotListener({ querySnapshot, error in
                
                if error == nil {
                    self.listConversation.removeAll()
                    
                    if let snapshot = querySnapshot {
                        for document in snapshot.documents {
                            let dados = document.data()
                            self.listConversation.append(Conversation(dicionario: dados))
                        }
                        self.screen?.reloadCollectionView()
                    }
                }
                
            })
            
        }
    }
    
    func getContact(){
        self.listContact.removeAll()
        self.db?.collection("usuarios").document(self.idUserOn ?? "").collection("contatos").getDocuments(completion: { snapshotResult, error in
            
            if error != nil {
                print("error get contact")
                return
            }
            
            if let snapshot = snapshotResult {
                for document in snapshot.documents {
                    let dadosContato = document.data()
                    self.listContact.append(Contact(dicionario: dadosContato))
                }
                self.screen?.reloadCollectionView()
            }
        })
    }
}

extension HomeViewController: NavViewProtocol {
   
    func typeScreenMessage(type: TypeConversationOrContact) {
        switch type {
        case .contact:
            self.screenContact = true
            self.getContact()
        case .conversation:
            self.screenContact = false
            self.addListenerRecuperarConversa()
            self.screen?.reloadCollectionView()
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
}

extension HomeViewController: ContactProtocol {
    func alertStateError(titulo: String, message: String) {
        self.alert?.getAlert(titulo: titulo, mensagem: message)
    }
    
    func sucessContact() {
        self.alert?.getAlert(titulo: "Ebaaaa", mensagem: "Usuário cadastrado com sucesso!", completion: {
            self.getContact()
        })
    }
    
    
}
