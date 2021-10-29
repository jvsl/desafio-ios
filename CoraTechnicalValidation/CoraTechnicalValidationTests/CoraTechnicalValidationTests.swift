//
//  CoraTechnicalValidationTests.swift
//  CoraTechnicalValidationTests
//
//  Created by joão lucas on 21/04/21.
//

import XCTest
@testable import CoraTechnicalValidation

class CoraTechnicalValidationTests: XCTestCase {
    
    private var loginSut: LoginSUT!
    
    override func setUp() {
        super.setUp()
        
        loginSut = makeSut()
    }

    func testWrongValidatePasswordCase() throws {
        
        loginSut.viewModel.validatePassword("wrongPassword")
        
        XCTAssertTrue(loginSut.coordinator.errorCalled)
    }

    func testCorrectPasswordCase() throws {
       
        loginSut.viewModel.validatePassword("testecora")

        XCTAssertTrue(loginSut.coordinator.orderListCalled)
    }
    
    private func makeSut() -> LoginSUT {
        let coordinator = CoordinatorMock()
        let viewModel = LoginViewModel(coordinator: coordinator)
        
        return LoginSUT(viewModel: viewModel, coordinator: coordinator)
    }
    
    private struct LoginSUT {
        let viewModel: LoginViewModel
        let coordinator: CoordinatorMock
    }
}


class CoordinatorMock: Coordinator {
    var orderListCalled = false
    var errorCalled = false
    func openOrderList() {
        orderListCalled = true
    }
    
    func error() {
        errorCalled = true
    }
}
