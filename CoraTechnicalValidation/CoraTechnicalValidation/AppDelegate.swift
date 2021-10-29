//
//  AppDelegate.swift
//  CoraTechnicalValidation
//
//  Created by joão lucas on 21/04/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationViewController: UINavigationController?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow(frame: UIScreen.main.bounds)
        let controller = LoginViewController(
            viewModel: LoginViewModel(coordinator: LoginCoordinator()))
      
        navigationViewController = UINavigationController(
            rootViewController: controller)
        navigationViewController?.setNavigationBarHidden(
            true, animated: false)
        
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

