//
//  SportTableViewCell.swift
//  LoginViewCode-curso
//
//  Created by Luan Arruda on 21/03/24.
//

import UIKit

class SportTableViewCell: UITableViewCell {
    
    static let identifier: String = "SportTableViewCell"
    
    var data: [Sport] = []
    
    lazy var collectionView: SportTableViewCellScreen = {
        let view = SportTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configSuperView()
        self.configSportTableViewCellScreenConstraint()
        self.collectionView.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView(){
        self.contentView.addSubview(self.collectionView)
    }
    
    private func configSportTableViewCellScreenConstraint(){
        self.collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    public func dataCollection(data: [Sport]) {
        self.data = data
    }
    
}

extension SportTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SportCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: SportCollectionViewCell.identifier, for: indexPath) as? SportCollectionViewCell
        cell?.setUpCell(data: self.data[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 100)
    }
    
}
