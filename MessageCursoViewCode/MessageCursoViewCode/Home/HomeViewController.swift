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
    }
    
    override func loadView() {
        self.screen = HomeScreen()
        self.view = self.screen
    }


}
