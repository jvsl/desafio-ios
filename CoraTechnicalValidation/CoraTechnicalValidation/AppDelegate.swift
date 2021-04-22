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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow(frame: UIScreen.main.bounds)
        let controller = ViewController()
      
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        
        return true
    }
}

