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
        tf.placeholder = "Digite aqui"
        tf.font = UIFont(name: CustomFont.poppingSemiBold, size: 14)
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        table.transform = CGAffineTransform(scaleX: 1, y: 1)
        table.separatorStyle = .none
        table.tableFooterView = UIView()
        return table
    }()
    
    public func configTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    public func reloadTableView() {
        self.tableView.reloadData()
    }
    
    public func configNavView(controller: ChatViewController){
        self.navView.controller = controller
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configNavViewConstraints()
        self.configTableViewConstraints()
        self.configMessageInputViewConstraints()
        self.configMessageBarConstraints()
        self.configSendButtonConstraints()
        self.configInputMessageTextFieldConstraints()
        
        //para adptar layout ao teclado
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleKeyboardNotification(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleKeyboardNotification(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // ========
        
        //metodo para efeito de animar botao de enviar
        
        self.inputMessageTextField.addTarget(self, action: <#T##Selector#>, for: UIControl.Event.editingChanged)
        
        //=====
        
        //constraint
        
        self.bottomConstraint = NSLayoutConstraint(item: self.messageInputView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        
        self.addConstraint(bottomConstraint ?? NSLayoutConstraint())
        
        self.sendButton.isEnabled = false
        self.sendButton.layer.opacity = 0.4
        self.sendButton.transform = .init(scaleX: 0.8, y: 0.8)
        self.inputMessageTextField.becomeFirstResponder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func sendButtonPressed() {
        self.sendButton.touchAnimation(s: self.sendButton)
    }
    
    //metodo para adptar teclado
    
    @objc
    func handleKeyboardNotification(notification: NSNotification) {
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            let isKeyboardShowing = notification.name == UIResponder.keyboardWillShowNotification
            
            self.bottomConstraint?.constant = isKeyboardShowing ? -keyboardHeight :0
            
            self.tableView.center.y = isKeyboardShowing ? self.tableView.center.y-keyboardHeight :
                self.tableView.center.y+keyboardHeight
            
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
                self.layoutIfNeeded()
            }, completion: { completed in
                // config
            })
        }
    }
    
    private func configSuperView() {
        self.addSubview(self.tableView)
        self.addSubview(self.navView)
        self.addSubview(self.messageInputView)
        self.messageInputView.addSubview(self.messageBar)
        self.messageBar.addSubview(self.sendButton)
        self.messageBar.addSubview(self.inputMessageTextField)
    }
    
    private func configNavViewConstraints() {
        self.navView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
    }
    
    private func configTableViewConstraints() {
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.navView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.messageInputView.snp.top)
        }
    }
    
    private func configMessageInputViewConstraints() {
        self.messageInputView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(80)
        }
    }
    
    private func configMessageBarConstraints() {
        self.messageBar.snp.makeConstraints { make in
            make.leading.equalTo(self.messageInputView.snp.leading).offset(20)
            make.trailing.equalTo(self.messageInputView.snp.trailing).inset(-20)
            make.centerY.equalToSuperview()
            make.height.equalTo(55)
        }
    }
    
    private func configSendButtonConstraints() {
        self.sendButton.snp.makeConstraints { make in
            make.trailing.equalTo(self.messageBar.snp.trailing).inset(-15)
            make.height.width.equalTo(55)
            make.bottom.equalTo(self.messageBar.snp.bottom).inset(-10)
        }
    }
    
    private func configInputMessageTextFieldConstraints() {
        self.inputMessageTextField.snp.makeConstraints { make in
            make.leading.equalTo(self.messageBar.snp.leading).offset(20)
            make.trailing.equalTo(self.sendButton.snp.leadingMargin).inset(-5)
            make.height.equalTo(45)
            make.centerY.equalToSuperview()
        }
    }
        
}

extension ChatViewScreen: UITextFieldDelegate {
    //implementar animacao do botao
}
