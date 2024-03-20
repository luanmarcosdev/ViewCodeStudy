//
//  UserDetailTableViewCell.swift
//  LoginViewCode-curso
//
//  Created by Luan Arruda on 20/03/24.
//

import UIKit
import SnapKit

class UserDetailTableViewCell: UITableViewCell {
    
    static let identifier: String = "UserDetailTableViewCell"
    
    lazy var userDetailView: UserDetailView = {
        let view = UserDetailView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configSuperView()
        self.configUserDetailViewConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configSuperView() {
        self.contentView.addSubview(userDetailView)
    }
    
    private func configUserDetailViewConstraint(){
        self.userDetailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    public func setUpCell(data: DataUser){
        self.userDetailView.nameLabel.text = data.name
        self.userDetailView.userImageView.image = UIImage(named: data.nameImage)
    }
    

}
