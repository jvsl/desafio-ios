//
//  LoginFormView.swift
//  CoraTechnicalValidation
//
//  Created by joão lucas on 22/04/21.
//

import UIKit

class LoginFormView: UIView {
    
    var passwordTextField: LoginTextField = {
        let textField = LoginTextField()
        
        textField
            .with(textColor: UIColor.gray)
            .with(rightImage: "passwordEyeIcon")
            .with(leftImage: "unlockIcon")
            .with(titleColor: UIColor.white)
            .with(titleText: "Senha")
            .with(secureTextEntry: true)
        
        return textField
    }()
    
    var emailTextField: LoginTextField = {
        let textField = LoginTextField()
        
        textField
            .with(textColor: UIColor.gray)
            .with(leftImage: "userIcon")
            .with(titleColor: UIColor.white)
            .with(titleText: "Nome ou Email")
        
        return textField
    }()
    
    var formStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        stackView.backgroundColor = .darkGray
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        loadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginFormView: BuildView {
    func addView() {
        addSubview(formStackView)
        
        formStackView.addArrangedSubview(emailTextField)
        formStackView.addArrangedSubview(passwordTextField)
    }
    
    func addConstraint() {
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(
                equalToConstant: 80),
            passwordTextField.heightAnchor.constraint(
                equalToConstant: 80),
            formStackView.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            formStackView.trailingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            formStackView.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor),
            formStackView.bottomAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
