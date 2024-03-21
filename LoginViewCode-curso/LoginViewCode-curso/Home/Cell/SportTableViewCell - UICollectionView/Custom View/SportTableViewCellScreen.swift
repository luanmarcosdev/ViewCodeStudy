//
//  SportTableViewCellScreen.swift
//  LoginViewCode-curso
//
//  Created by Luan Arruda on 21/03/24.
//

import UIKit

class SportTableViewCellScreen: UIView {
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .none
        cv.delaysContentTouches = false
        cv.register(SportCollectionViewCell.self, forCellWithReuseIdentifier: SportCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        cv.setCollectionViewLayout(layout, animated: false)
        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configCollectionViewConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configProtocolsCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource){
        self.collectionView.delegate = delegate
        self.collectionView.dataSource = dataSource
    }
    
    private func configSuperView(){
        self.addSubview(collectionView)
    }
    
    private func configCollectionViewConstraint(){
        self.collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
