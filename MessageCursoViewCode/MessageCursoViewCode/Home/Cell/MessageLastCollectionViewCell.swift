//
//  MessageLastCollectionViewCell.swift
//  MessageCursoViewCode
//
//  Created by Luan Arruda on 01/04/24.
//

import UIKit

class MessageLastCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "MessageLastCollectionViewCell"
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = false
        image.image = UIImage(systemName: "person.badge.plus")
        return image
    }()
    
    lazy var userName: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Adicionar novo Contato"
        label.font = UIFont(name: CustomFont.poppingMedium, size: 16)
        label.textColor = .darkGray
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
