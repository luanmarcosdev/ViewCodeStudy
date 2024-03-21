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
    
    private func configSuperView(){
        self.contentView.addSubview(collectionViewCell)
    }
    
    private func configCollectionViewCellConstraint() {
        self.collectionViewCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}
