//
//  SportTableViewCell.swift
//  LoginViewCode-curso
//
//  Created by Luan Arruda on 21/03/24.
//

import UIKit

class SportTableViewCell: UITableViewCell {
    
    static let identifier: String = "SportTableViewCell"
    
    lazy var sportTableViewCellScreen: SportTableViewCellScreen = {
        let view = SportTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configSuperView()
        self.configSportTableViewCellScreenConstraint()
        self.sportTableViewCellScreen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView(){
        self.contentView.addSubview(self.sportTableViewCellScreen)
    }
    
    private func configSportTableViewCellScreenConstraint(){
        self.sportTableViewCellScreen.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension SportTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
