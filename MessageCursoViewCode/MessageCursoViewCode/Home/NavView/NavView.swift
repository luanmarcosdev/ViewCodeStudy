//
//  NavView.swift
//  MessageCursoViewCode
//
//  Created by Luan Arruda on 27/03/24.
//

import UIKit

enum TypeConversationOrContact {
    case conversation
    case contact
}

protocol NavViewProtocol: AnyObject {
    func typeScreenMessage(type: TypeConversationOrContact)
}

class NavView: UIView {
    
    weak private var delegate: NavViewProtocol?
    
    func delegate(delegate: NavViewProtocol){
        self.delegate = delegate
    }
    
    lazy var navBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 35
        view.layer.maskedCorners = [.layerMaxXMaxYCorner]
        view.layer.shadowColor = UIColor(white: 0, alpha: 0.02).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
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
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    lazy var conversationButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(named: "chat2")?.withRenderingMode(.alwaysTemplate), for: .normal)
        bt.tintColor = .black
        bt.addTarget(self, action: #selector(self.tappedConversationButton), for: .touchUpInside)
        return bt
    }()
    
    lazy var contactButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(named: "people")?.withRenderingMode(.alwaysTemplate), for: .normal)
        bt.tintColor = .black
        bt.addTarget(self, action: #selector(self.tappedContactButton), for: .touchUpInside)
        return bt
    }()
    
    @objc
    func tappedConversationButton() {
        self.delegate?.typeScreenMessage(type: .conversation)
        self.conversationButton.tintColor = .systemPink
        self.contactButton.tintColor = .black
    }
    
    @objc
    func tappedContactButton() {
        self.delegate?.typeScreenMessage(type: .contact)
        self.conversationButton.tintColor = .black
        self.contactButton.tintColor = .systemPink
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configNavBackgroundViewConstraint()
        self.configNavBarConstraint()
        self.configSearchBarConstraint()
        self.configSearchLabelConstraint()
        self.configSearchButtonConstraint()
        self.configStackViewConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView(){
        self.addSubview(self.navBackgroundView)
        self.navBackgroundView.addSubview(self.navBar)
        self.navBar.addSubview(self.searchBar)
        self.navBar.addSubview(self.stackView)
        self.searchBar.addSubview(self.searchLabel)
        self.searchBar.addSubview(self.searchButton)
        self.stackView.addArrangedSubview(self.conversationButton)
        self.stackView.addArrangedSubview(self.contactButton)
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
    
    private func configSearchBarConstraint(){
        self.searchBar.snp.makeConstraints { make in
            make.leading.equalTo(self.navBar.snp.leading).offset(30)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(self.stackView.snp.leading).inset(-20)
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
            make.trailing.equalTo(self.searchBar.snp.trailing).inset(20)
            make.centerY.equalTo(self.searchBar.snp.centerY)
            make.width.height.equalTo(20)
        }
    }
    
    private func configStackViewConstraint() {
        self.stackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(30)
            make.centerY.equalTo(self.navBar.snp.centerY)
            make.width.equalTo(70)
            make.height.equalTo(30)
        }
    }
    

}
