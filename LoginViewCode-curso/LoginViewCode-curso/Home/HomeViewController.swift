//
//  HomeViewController.swift
//  LoginViewCode-curso
//
//  Created by Luan Arruda on 19/03/24.
//

import UIKit

class HomeViewController: UIViewController {

    var homeScreen: HomeScreen?
    var data: [DataUser] = [DataUser(name: "Luan", nameImage: "boy1"),
                             DataUser(name: "Marcos", nameImage: "boy2"),
                             DataUser(name: "Maysa", nameImage: "default")]
    
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
        return self.data.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 3 {
            let cell: SportTableViewCell? = tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell
            return cell ?? UITableViewCell()
        }
        
        let cell: UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
        cell?.setUpCell(data: data[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
