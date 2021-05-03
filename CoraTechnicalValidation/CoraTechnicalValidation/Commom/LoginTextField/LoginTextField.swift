//
//  LoginTextField.swift
//  CoraTechnicalValidation
//
//  Created by joão lucas on 22/04/21.
//

import UIKit

class LoginTextField: UITextField {
    
    // Mark - Private Properties
    
    private let textFieldPadding = UIEdgeInsets(
        top: 0, left: 54, bottom: 0, right: 54)
    private var titleAnimationHasFired = false
    private var topTitleConstraint: NSLayoutConstraint?
    private var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.font = UIFont.boldSystemFont(ofSize: 12.0)
        
        return label
    }()
    
    private var leftViewAccessory: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
       
        imageView.contentMode = .scaleAspectFit
        
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var rightViewAccessory: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        
        return button
    }()
    
    // Mark - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        layer.cornerRadius = 8
        borderStyle = .bezel
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.white.cgColor
        delegate = self
        
        loadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark - Public Methods
    
    @discardableResult
    func with(titleText: String) -> Self {
        title.text = titleText
        
        return self
    }
    
    @discardableResult
    func with(titleColor: UIColor) -> Self {
        title.textColor = titleColor
        
        return self
    }
    
    @discardableResult
    func with(textColor: UIColor) -> Self {
        self.textColor = textColor
        
        return self
    }
    
    @discardableResult
    func with(leftImage: String = "userIcon") -> Self {
        leftViewAccessory.image = UIImage(named: leftImage)
        
        return self
    }
    
    @discardableResult
    func with(rightImage: String = "passwordEyeIcon") -> Self {
        rightViewAccessory.setBackgroundImage(
            UIImage(named: rightImage),
            for: .normal)
        
        return self
    }
    
    @discardableResult
    func with(secureTextEntry: Bool) -> Self {
        isSecureTextEntry = secureTextEntry
        
        return self
    }
    
    private func startTitleAnimation() {
        if !titleAnimationHasFired {
            titleAnimationHasFired = !titleAnimationHasFired
            
            topTitleConstraint?.constant = -20
            UIView.animate(withDuration: 0.5) {
                self.layoutIfNeeded()
            }
        }
    }
}

extension LoginTextField {
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textFieldPadding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textFieldPadding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textFieldPadding)
    }
}

extension LoginTextField: BuildView {
    func addView() {
        addSubview(title)
        addSubview(leftViewAccessory)
        addSubview(rightViewAccessory)
    }
    
    func addConstraint() {
        NSLayoutConstraint.activate([
            leftViewAccessory.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 20),
            leftViewAccessory.centerYAnchor.constraint(
                equalTo: centerYAnchor),
            leftViewAccessory.heightAnchor.constraint(
                equalToConstant: 24),
            leftViewAccessory.widthAnchor.constraint(
                equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            rightViewAccessory.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -20),
            rightViewAccessory.centerYAnchor.constraint(
                equalTo: centerYAnchor),
            rightViewAccessory.heightAnchor.constraint(
                equalToConstant: 24),
            rightViewAccessory.widthAnchor.constraint(
                equalToConstant: 24)
        ])
        
        topTitleConstraint = title.centerYAnchor.constraint(
            equalTo: centerYAnchor)
        topTitleConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 54),
            title.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -54),
        ])
    }
}

extension LoginTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        startTitleAnimation()
    }
}

protocol BuildView {
    func addView()
    func addConstraint()
    func loadView()
}

extension BuildView {
    func loadView() {
        addView()
        addConstraint()
    }
}

