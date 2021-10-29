//
//  LoginView.swift
//  CoraTechnicalValidation
//
//  Created by joão lucas on 22/04/21.
//

import UIKit

class LoginView: UIView {
    
    private var topConstraint: NSLayoutConstraint?
    private var topFooterButtonsContraint:  NSLayoutConstraint?
    
    private var stackViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.backgroundColor = .clear
        
        return stackView
        
    }()
    
    var formView: LoginFormView = {
        return LoginFormView()
    }()
    
    var headerLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "splashscreenImage")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var footerButtonStack: LoginFooterButton = {
        let footerButton = LoginFooterButton()
        footerButton.translatesAutoresizingMaskIntoConstraints = false
        
        return footerButton
    }()
    
    func startAnimation() {
        topConstraint?.isActive = false
        topFooterButtonsContraint?.isActive = false
        
        UIView.animate(withDuration: 1.0) {
            self.footerButtonStack.bottomAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.bottomAnchor)
                .isActive = true
            
            self.headerLogoImageView.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: 100).isActive = true
            self.layoutIfNeeded()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView: BuildView {
    
    func addView() {
        addSubview(headerLogoImageView)
        addSubview(formView)
        addSubview(footerButtonStack)
    }
    
    func addConstraint() {
        NSLayoutConstraint.activate([
            headerLogoImageView.heightAnchor.constraint(
                equalToConstant: 100),
            headerLogoImageView.widthAnchor.constraint(
                equalToConstant: 200),
            headerLogoImageView.centerXAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
        
        topConstraint = headerLogoImageView.centerYAnchor.constraint(
            equalTo: safeAreaLayoutGuide.centerYAnchor)
        topConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            formView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            formView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            formView.topAnchor.constraint(
                equalTo: headerLogoImageView.bottomAnchor, constant: 50),
        ])
        
        topFooterButtonsContraint = footerButtonStack.topAnchor.constraint(
            equalTo: safeAreaLayoutGuide.bottomAnchor)
        topFooterButtonsContraint?.isActive = true
        NSLayoutConstraint.activate([
            footerButtonStack.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            footerButtonStack.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
}
