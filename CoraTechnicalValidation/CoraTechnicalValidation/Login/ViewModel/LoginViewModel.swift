//
//  LoginViewModel.swift
//  CoraTechnicalValidation
//
//  Created by joão lucas on 05/05/21.
//

import Foundation

protocol Coordinator {
    func openOrderList()
    func error()
}

struct LoginViewModel {
    
    let coordinator: Coordinator
    
    func validatePassword(_ password: String) {
        if password == "testecora" {
            coordinator.openOrderList()
        } else {
            coordinator.error()
        }
    }
}
