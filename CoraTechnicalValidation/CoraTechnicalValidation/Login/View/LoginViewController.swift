//
//  LoginViewController.swift
//  CoraTechnicalValidation
//
//  Created by joão lucas on 22/04/21.
//

import UIKit

class LoginViewController: UIViewController {

    private var loginView = LoginView()
    private var viewModel: LoginViewModel
    
    override func loadView() {
        super.loadView()
        
        view = loginView
    }
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
    
        DispatchQueue.main.async {
            self.loginView.startAnimation()
        }
        
        
    }
}
