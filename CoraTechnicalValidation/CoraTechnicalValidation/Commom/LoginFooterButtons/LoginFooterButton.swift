//
//  LoginFooterButton.swift
//  CoraTechnicalValidation
//
//  Created by joão lucas on 26/04/21.
//

import UIKit

class LoginFooterButton: UIView {

    private var stackViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    private var forgetPasswordButton: LoginButton = {
        let button = LoginButton()
        
        return button
    }()
    
    private var accountAccessButton: LoginButton = {
        let button = LoginButton()
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        loadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginFooterButton: BuildView {
    func addView() {
        addSubview(stackViewContainer)
        
        stackViewContainer.addArrangedSubview(accountAccessButton)
        stackViewContainer.addArrangedSubview(forgetPasswordButton)
        
        accountAccessButton.with(text: "Acessar minha conta")
            .with(color: .black)
            .with(textColor: .white)
            .with(color: .magenta)
            .with(rightImage: "rightArrowIcon")
        
        forgetPasswordButton.with(text: "Esqueci minha senha")
            .with(color: .clear)
            .with(textColor: .white)
    }
    
    func addConstraint() {
        NSLayoutConstraint.activate([
            stackViewContainer.trailingAnchor.constraint(
                equalTo: self.trailingAnchor),
            stackViewContainer.leadingAnchor.constraint(
                equalTo: self.leadingAnchor),
            stackViewContainer.topAnchor.constraint(
                equalTo: self.topAnchor),
            stackViewContainer.bottomAnchor.constraint(
                equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            forgetPasswordButton.heightAnchor.constraint(
                equalToConstant: 80),
            accountAccessButton.heightAnchor.constraint(
                equalToConstant: 80),
            accountAccessButton.leadingAnchor.constraint(
                equalTo: stackViewContainer.leadingAnchor),
            accountAccessButton.trailingAnchor.constraint(
                equalTo: stackViewContainer.trailingAnchor),
            forgetPasswordButton.leadingAnchor.constraint(
                equalTo: stackViewContainer.leadingAnchor),
            forgetPasswordButton.trailingAnchor.constraint(
                equalTo: stackViewContainer.trailingAnchor)
        ])
    }
}
