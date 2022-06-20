//
//  wanted_WeatherUITestsLaunchTests.swift
//  wanted_WeatherUITests
//
//  Created by 김승찬 on 2022/06/20.
//

import XCTest

class wanted_WeatherUITestsLaunchTests: XCTestCase {
    
    private var app:XCUIApplication!
    private var emailTF:XCUIElement!
    private var passwordTF:XCUIElement!
    private var repeatPasswordTF:XCUIElement!
    private var signupButton:XCUIElement!
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    
    func test_Something() {

   
    }
    
    
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app
        
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
