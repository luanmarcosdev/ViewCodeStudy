//
//  SportCollectionViewCellScreen.swift
//  LoginViewCode-curso
//
//  Created by Luan Arruda on 21/03/24.
//

import UIKit

class SportCollectionViewCellScreen: UIView {
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var sportName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configImageViewConstraint()
        self.configSportNameConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView(){
        self.addSubview(imageView)
        self.addSubview(sportName)
    }
    
    private func configImageViewConstraint() {
        self.imageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(self.sportName.snp.top).inset(10)
        }
    }
    
    private func configSportNameConstraint() {
        self.sportName.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.bottom.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
    }
    

}
