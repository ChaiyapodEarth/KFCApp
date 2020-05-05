//
//  KFCTests.swift
//  KFCTests
//
//  Created by Kittinun Chobtham on 19/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import XCTest
@testable import KFC

class KFCTests: XCTestCase {

    var viewController: SigninViewController?
    
    override func setUpWithError() throws {
        viewController = SigninViewController()
    }

    override func tearDownWithError() throws {
        viewController = nil
    }

    func testInputEmailIsCorrected() {
        let emailTextField = UITextField()
    
        viewController?.emailTextField = emailTextField
        
        emailTextField.text = "Nhong"
        
        XCTAssertNotNil(viewController?.emailTextField.text)
    }
    
    func testInputEmailIsBlank() {
        let emailTextField = UITextField()
        
        viewController?.emailTextField = emailTextField
        
        XCTAssertEqual(viewController?.emailTextField.text, "")
    }
    
}
