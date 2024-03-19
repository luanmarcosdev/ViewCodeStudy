//
//  HomeViewController.swift
//  LoginViewCode-curso
//
//  Created by Luan Arruda on 19/03/24.
//

import UIKit

class HomeViewController: UIViewController {

    var homeScreen: HomeScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }
    

}
