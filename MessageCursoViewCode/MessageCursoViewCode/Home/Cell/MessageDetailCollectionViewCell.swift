//
//  MessageDetailCollectionViewCell.swift
//  MessageCursoViewCode
//
//  Created by Luan Arruda on 01/04/24.
//

import UIKit

class MessageDetailCollectionViewCell: UICollectionViewCell {
 
    static let identifier: String = "MessageDetailCollectionViewCell"
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 26
        image.image = UIImage(named: "default")
        return image
    }()
    
    lazy var userName: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configImageViewConstraints()
        self.configUserNameConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViewContact(contact: Contact){
        self.setUserName(userName: contact.name ?? "")
    }
    
    func setUpViewConversation(conversation: Conversation){
        self.setUserNameAttributedText(conversation)
    }
    
    private func setUserName(userName: String) {
        let attributeText = NSMutableAttributedString(string: userName, attributes: [NSAttributedString.Key.font : UIFont(name: CustomFont.poppingMedium, size: 16) ?? UIFont(), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        self.userName.attributedText = attributeText
    }
    
    private func setUserNameAttributedText(_ conversation: Conversation?){
        let attributeText = NSMutableAttributedString(string: "\(conversation?.name ?? "" )", attributes: [NSAttributedString.Key.font: UIFont(name: CustomFont.poppingMedium, size: 16) ?? UIFont(), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        attributeText.append(NSAttributedString(string: "\n\(conversation?.lastMessage ?? "")", attributes: [NSAttributedString.Key.font: UIFont(name: CustomFont.poppingMedium, size: 14) ?? UIFont(), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        
        self.userName.attributedText = attributeText
    }
    
    private func configSuperView() {
        self.addSubview(imageView)
        self.addSubview(userName)
    }
    
    private func configImageViewConstraints(){
        self.imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(55)
        }
    }
    
    private func configUserNameConstraints(){
        self.userName.snp.makeConstraints { make in
            make.leading.equalTo(self.imageView.snp.trailing).offset(15)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(-10)
        }
    }
}
