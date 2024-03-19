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
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
//        homeScreen?.delegate = self
//        homeScreen?.dataSource = self
    }
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color: [UIColor] = [.orange,.green,.red,.blue]
        let cell = UITableViewCell()
        cell.backgroundColor = color[indexPath.row]
        return cell
    }
    
}
