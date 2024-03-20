//
//  HomeScreen.swift
//  LoginViewCode-curso
//
//  Created by Luan Arruda on 19/03/24.
//

import UIKit
import SnapKit

class HomeScreen: UIView {
    
//    weak var delegate: UITableViewDelegate?
//    weak var dataSource: UITableViewDataSource?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        //para registrar a celula
        tableView.register(UserDetailTableViewCell.self, forCellReuseIdentifier: UserDetailTableViewCell.identifier)
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configBackground()
        self.configTableViewConstraint()
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    func configSuperView(){
        self.addSubview(self.tableView)
    }
    
    private func configBackground() {
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configTableViewConstraint() {
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.right.equalTo(self.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left)
        }
    }
    
    
    
    
}
