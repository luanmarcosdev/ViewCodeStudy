//
//  ChatViewScreen.swift
//  MessageCursoViewCode
//
//  Created by Luan Arruda on 02/04/24.
//

import UIKit
import AVFoundation

class ChatViewScreen: UIView {
    
    var bottomConstraint: NSLayoutConstraint?
    var player: AVAudioPlayer?
    
    lazy var navView: ChatNavigationView = {
        let view = ChatNavigationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var messageInputView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var messageBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.appLight
        view.layer.cornerRadius = 20
        return view
    }()

    lazy var sendButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = CustomColor.appLight
        bt.layer.cornerRadius = 22.5
        bt.layer.shadowColor = CustomColor.appLight.cgColor
        bt.layer.shadowRadius = 10
        bt.layer.shadowOffset = CGSize(width: 0, height: 5)
        bt.layer.shadowOpacity = 0.3
        bt.addTarget(self, action: #selector(self.sendButtonPressed), for: .touchUpInside)
        bt.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        return bt
    }()
    
    lazy var inputMessageTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func sendButtonPressed() {
        self.sendButton.touchAnimation(s: self.sendButton)
    }
    
    private func configSuperView() {
        
    }
    
}
