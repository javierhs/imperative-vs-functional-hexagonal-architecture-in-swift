//
//  RegisterUserViewController.swift
//  BackOffice-iOS-UI-Tests
//
//  Created by Javier Hernandez Sansalvador on 13/10/23.
//

import XCTest

final class RegisterUserViewController: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserCanRegisterWithAnUnidentifiedEmaill() throws {
        // Administrator opens our app
        let app = XCUIApplication()
        app.launch()

        //he chooses user management option
    
        //he chooses to register a new user
        
        //he enters valid user data details
        
        //he tries to create the user
        
        //he is notified by a confirmation created user message
    }
}
