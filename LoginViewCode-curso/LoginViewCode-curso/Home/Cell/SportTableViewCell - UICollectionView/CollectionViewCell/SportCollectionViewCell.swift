//
//  SportCollectionViewCell.swift
//  LoginViewCode-curso
//
//  Created by Luan Arruda on 21/03/24.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "SportCollectionViewCell"
    
    lazy var collectionViewCell: SportCollectionViewCellScreen = {
        let collectionViewCell = SportCollectionViewCellScreen()
        collectionViewCell.translatesAutoresizingMaskIntoConstraints = false
        collectionViewCell.layer.borderWidth = 6.0
        collectionViewCell.layer.borderColor = UIColor.blue.cgColor
        return collectionViewCell
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configCollectionViewCellConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setUpCell(data: Sport){
        self.collectionViewCell.sportName.text = data.name
        self.collectionViewCell.imageView.image = UIImage(named: data.nameImage)
    }
    
    private func configSuperView(){
        self.contentView.addSubview(collectionViewCell)
    }
    
    private func configCollectionViewCellConstraint() {
        self.collectionViewCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}
