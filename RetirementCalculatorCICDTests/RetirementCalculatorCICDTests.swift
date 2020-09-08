//
//  RetirementCalculatorCICDTests.swift
//  RetirementCalculatorCICDTests
//
//  Created by Jake Connerly on 9/7/20.
//  Copyright © 2020 jake connerly. All rights reserved.
//

import XCTest
@testable import RetirementCalculatorCICD

class RetirementCalculatorCICDTests: XCTestCase {
    
    var sut: ViewController?

    override func setUpWithError() throws {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(identifier: "ViewController") as? ViewController
        sut?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func tap(button: Any) {
        switch button {
        case is UIButton:
            let button = button as? UIButton
            button?.sendActions(for: .touchUpInside)
        default:
            return
        }
    }

    func testExample() throws {
        sut?.monthlyInvTextField.text = "300"
        sut?.ageTextField.text = "30"
        sut?.plannedRetAgeTextField.text = "65"
        sut?.interestRateTextField.text = "4"
        sut?.currentSavingsTextField.text = "1000"
        tap(button: sut?.calculateButton)
        
         let expectedText = "If you save $300.0 every month for 35 years, and invest that money plus your current investment of 1000.0 at a 4.0% annual interest rate, you will have $14255938559.294945 by the time you are 65."
        
        XCTAssertEqual(sut?.resultLabel.text, expectedText)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
