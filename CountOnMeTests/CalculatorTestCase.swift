//
//  CalculatorTestCase.swift
//  CountOnMeTests
//
//  Created by Maxime Landu-Wa on 23/09/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe



class CalculatorTestCase: XCTestCase {

    // MARK: - Properties
    var calculator = Calculator()

    // MARK: - Setup

    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }

    // MARK: - Helpers


    // MARK: - Tests

    func testGivenUserPressingEqual_WhenTwoIsAddedToThree_ThenResultShouldBeTwo() {
        calculator.addElement(number: 3)
        calculator.addOperator(calcOperator: "+")
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.result, "5")
    }

    func testGivenUserPressingEqual_WhenTenIsDividedByTwo_ThenResultShouldBeFive() {
        calculator.addElement(number: 10)
        calculator.addOperator(calcOperator: "/")
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.result, "5")
    }

    func testGivenUserPressingEqual_WhenTwoIsMultipliedByTen_ThenResultShouldBeTwenty() {
        calculator.addElement(number: 2)
        calculator.addOperator(calcOperator: "*")
        calculator.addElement(number: 1)
        calculator.addElement(number: 0)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.result, "20")
    }

    func testGivenUserPressingEqual_WhenTenThousandIsMultipliedByFiveHundred_ThenResultShouldBeFiveMillions() {
        calculator.addElement(number: 10000)
        calculator.addOperator(calcOperator: "*")
        calculator.addElement(number: 500)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.result, "5000000")
    }

    func testGivenUserPressingEqual_WhenFiveIsDividedByTwo_ThenResultShouldBeTwoAndAHalf() {
        calculator.addElement(number: 5)
        calculator.addOperator(calcOperator: "/")
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.result, "2,5")
    }

    func testGivenPressingEqual_WhenTwoIsAddedToTwelveMultipliedByFifty_ThenResultShouldBeSixHundredAndOne() {
        calculator.addElement(number: 2)
        calculator.addOperator(calcOperator: "+")
        calculator.addElement(number: 12)
        calculator.addOperator(calcOperator: "*")
        calculator.addElement(number: 50)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.result, "602")
    }

    func testGivenPressingEqual_WhenTwelveIsMultipliedAndThenDividedByFive_ThenTheProgramShouldReturnAnError () {
        calculator.addElement(number: 12)
        calculator.addOperator(calcOperator: "*")
        calculator.addOperator(calcOperator: "/")
        calculator.addElement(number: 5)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.canAddOperator, false)
    }
}
