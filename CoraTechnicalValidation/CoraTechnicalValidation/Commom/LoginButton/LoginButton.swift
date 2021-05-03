//
//  LoginButton.swift
//  CoraTechnicalValidation
//
//  Created by joão lucas on 24/04/21.
//

import UIKit

class LoginButton: UIButton {
    
    private var rightViewAccessory: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
    
        return imageView
    }()
    
    private var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = true
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    func with(text: String) -> Self {
        setTitle(text, for: .normal)
        
        return self
    }
    
    @discardableResult
    func with(color: UIColor) -> Self {
        backgroundColor = color
        
        return self
    }
    
    @discardableResult
    func with(textColor: UIColor) -> Self {
        setTitleColor(textColor, for: .normal)
        
        return self
    }
    
    @discardableResult
    func with(rightImage: String = "passwordEyeIcon") -> Self {
        rightViewAccessory.image = UIImage(named: rightImage)
        
        return self
    }
}

extension LoginButton: BuildView {
    func addView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(rightViewAccessory)
        addSubview(title)
        
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40)
        contentHorizontalAlignment = .left
        layer.cornerRadius = 8
    }
    
    func addConstraint() {
        NSLayoutConstraint.activate([
            rightViewAccessory.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -20),
            rightViewAccessory.centerYAnchor.constraint(
                equalTo: centerYAnchor),
            rightViewAccessory.heightAnchor.constraint(
                equalToConstant: 24),
            rightViewAccessory.widthAnchor.constraint(
                equalToConstant: 24)
        ])
    }
}
