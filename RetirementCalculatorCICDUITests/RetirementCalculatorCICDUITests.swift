//
//  RetirementCalculatorCICDUITests.swift
//  RetirementCalculatorCICDUITests
//
//  Created by Jake Connerly on 9/7/20.
//  Copyright © 2020 jake connerly. All rights reserved.
//

import XCTest

class RetirementCalculatorUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTContext.runActivity(named: "Screenshot") { (activity) in
            let app = XCUIApplication()
            
            let key0 = app.keys["0"]
            let key1 = app.keys["1"]
            let key3 = app.keys["3"]
            let key4 = app.keys["4"]
            let key5 = app.keys["5"]
            let key6 = app.keys["6"]
            
            app.textFields["Monthly Investments"].tap()
            key3.tap()
            key0.tap()
            key0.tap()
            app.textFields["Your Current Age"].tap()
            key3.tap()
            key0.tap()
            app.textFields["Your Planned Retirement Age"].tap()
            key6.tap()
            key5.tap()
            app.textFields["Average Intrest Rates of Investments"].tap()
            key4.tap()
            app.textFields["Current Savings"].tap()
            key1.tap()
            for _ in 0...2 {
                key0.tap()
            }
            
            app/*@START_MENU_TOKEN@*/.staticTexts["Calculate Retirement Amount"]/*[[".buttons[\"Calculate Retirement Amount\"].staticTexts[\"Calculate Retirement Amount\"]",".staticTexts[\"Calculate Retirement Amount\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            
            
            let resultText = app.staticTexts.element(matching: .any, identifier: "resultLabel")
            let expectedText = "If you save $300.0 every month for 35 years, and invest that money plus your current investment of 1000.0 at a 4.0% annual interest rate, you will have $14255938559.294945 by the time you are 65."
            
            XCTAssertEqual(resultText.label, expectedText)
        }
    }
}
