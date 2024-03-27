//
//  HomeViewController.swift
//  MessageCursoViewCode
//
//  Created by Luan Arruda on 27/03/24.
//

import UIKit

class HomeViewController: UIViewController {

    var screen: HomeScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = CustomColor.appLight
    }
    
    override func loadView() {
        self.screen = HomeScreen()
        self.view = self.screen
    }


}
