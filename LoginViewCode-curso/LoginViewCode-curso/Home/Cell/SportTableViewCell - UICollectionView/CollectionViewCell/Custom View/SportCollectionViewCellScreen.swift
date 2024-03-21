//
//  SportCollectionViewCellScreen.swift
//  LoginViewCode-curso
//
//  Created by Luan Arruda on 21/03/24.
//

import UIKit

class SportCollectionViewCellScreen: UIView {
    
    lazy var viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configViewBackgroundConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView(){
        self.addSubview(viewBackground)
    }
    
    private func configViewBackgroundConstraint() {
        self.viewBackground.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
