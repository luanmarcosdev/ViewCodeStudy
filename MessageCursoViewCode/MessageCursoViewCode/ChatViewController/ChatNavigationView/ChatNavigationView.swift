//
//  ChatNavigationView.swift
//  MessageCursoViewCode
//
//  Created by Luan Arruda on 02/04/24.
//

import UIKit

class ChatNavigationView: UIView {
    
    //testar se pode colocar isso dentro da criacao do elemento
    
    var controller: ChatViewController? {
        didSet {
            self.backButton.addTarget(controller, action: #selector(ChatViewController.tappedBackButton), for: .touchUpInside)
        }
    }
    
    lazy var navBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 35
        view.layer.maskedCorners = [.layerMaxXMaxYCorner]
        view.layer.shadowColor = UIColor(white: 0, alpha: 0.05).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        return view
    }()
    
    lazy var navBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var searchBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.appLight
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var searchLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Digite aqui"
        lb.font = UIFont(name: CustomFont.poppingMedium, size: 16)
        lb.textColor = .lightGray
        return lb
    }()
    
    lazy var searchButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(named: "search"), for: .normal)
        return bt
    }()
    
    lazy var backButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(named: "back"), for: .normal)
        return bt
    }()
    
    lazy var customImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 26
        image.image = UIImage(named: "default")
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configNavBackgroundViewConstraint()
        self.configNavBarConstraint()
        self.configBackButtonConstraint()
        self.configCustomImageConstraint()
        self.configSearchBarConstraint()
        self.configSearchLabelConstraint()
        self.configSearchButtonConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView() {
        self.addSubview(self.navBackgroundView)
        self.navBackgroundView.addSubview(self.navBar)
        self.navBar.addSubview(self.backButton)
        self.navBar.addSubview(self.customImage)
        self.navBar.addSubview(self.searchLabel)
        self.searchLabel.addSubview(self.searchLabel)
        self.searchBar.addSubview(self.searchButton)
    }
    
    private func configNavBackgroundViewConstraint(){
        self.navBackgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configNavBarConstraint(){
        self.navBar.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.right.bottom.left.equalToSuperview()
        }
    }
    
    private func configBackButtonConstraint(){
        self.backButton.snp.makeConstraints { make in
            make.leading.equalTo(self.navBar.snp.leading).offset(30)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(30)
        }
    }
    
    private func configCustomImageConstraint(){
        self.customImage.snp.makeConstraints { make in
            make.leading.equalTo(self.backButton.snp.trailing).offset(20)
            make.height.width.equalTo(55)
            make.centerY.equalToSuperview()
        }
    }
    
    private func configSearchBarConstraint(){
        self.searchBar.snp.makeConstraints { make in
            make.leading.equalTo(self.customImage.snp.trailing).offset(20)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(self.navBar.snp.trailing).inset(-20)
            make.height.equalTo(55)
        }
    }
    
    private func configSearchLabelConstraint(){
        self.searchLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.searchBar.snp.leading).offset(25)
            make.centerY.equalToSuperview()
        }
    }
    
    private func configSearchButtonConstraint(){
        self.searchButton.snp.makeConstraints { make in
            make.trailing.equalTo(self.navBar.snp.trailing).inset(-20)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(20)
        }
    }
    
    
    
}
