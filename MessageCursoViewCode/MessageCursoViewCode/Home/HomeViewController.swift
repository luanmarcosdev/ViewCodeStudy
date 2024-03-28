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
    
}

extension HomeViewController: NavViewProtocol {
   
    func typeScreenMessage(type: TypeConversationOrContact) {
        switch type {
        case .contact:
            self.screenContact = true
        case .conversation:
            self.screenContact = false
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
