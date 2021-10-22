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

    func testGivenUserPressingEqual_WhenTwoIsAddedToThree_ThenResultShouldBeFive() {
        calculator.addElement(number: 3)
        calculator.addOperator(calcOperator: "+")
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "5")
    }

    func testGivenUserPressingEqual_WhenTenIsDividedByTwo_ThenResultShouldBeFive() {
        calculator.addElement(number: 10)
        calculator.addOperator(calcOperator: "/")
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "5")
    }

    func testGivenUserPressingEqual_WhenTwoIsMultipliedByTen_ThenResultShouldBeTwenty() {
        calculator.addElement(number: 2)
        calculator.addOperator(calcOperator: "*")
        calculator.addElement(number: 1)
        calculator.addElement(number: 0)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "20")
    }

    func testGivenUserPressingEqual_WhenTenThousandIsMultipliedByFiveHundred_ThenResultShouldBeFiveMillions() {
        calculator.addElement(number: 10000)
        calculator.addOperator(calcOperator: "*")
        calculator.addElement(number: 500)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "5000000")
    }

    func testGivenUserPressingEqual_WhenTenIsAddedToSeventyNineAndAddedToThirtyOne_ThenResultShouldBeAHundredAndTwenty() {
        calculator.addElement(number: 10)
        calculator.addOperator(calcOperator: "+")
        calculator.addElement(number: 79)
        calculator.addOperator(calcOperator: "+")
        calculator.addElement(number: 31)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "120")
    }

    func testGivenUserPressingEqual_WhenTenIsAddedToSeventyNineAndAddedToThirtyOneThenSubstractThirty_ThenResultShouldBeNinety() {
        calculator.addElement(number: 10)
        calculator.addOperator(calcOperator: "+")
        calculator.addElement(number: 79)
        calculator.addOperator(calcOperator: "+")
        calculator.addElement(number: 31)
        calculator.addOperator(calcOperator: "-")
        calculator.addElement(number: 30)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "90")
    }

    func testGivenUserPressingEqual_WhenSeventyFiveIsMultipliedByThirtyAndMultipliedByAHundred_ThenResultShouldBeFourThousandAndFiveHundred() {
        calculator.addElement(number: 75)
        calculator.addOperator(calcOperator: "*")
        calculator.addElement(number: 30)
        calculator.addOperator(calcOperator: "*")
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "4500")
    }

    func testGivenUserPressingEqual_WhenFiveIsDividedByTwo_ThenResultShouldBeTwoAndAHalf() {
        calculator.addElement(number: 5)
        calculator.addOperator(calcOperator: "/")
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "2.5")
    }

    func testGivenUserPressingEqual_WhenFiveIsMultipliedByTwoThenDividedByTwo_ThenResultShouldBeFive() {
        calculator.addElement(number: 5)
        calculator.addOperator(calcOperator: "*")
        calculator.addElement(number: 2)
        calculator.addOperator(calcOperator: "/")
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "5")
    }

    func testGivenUserPressingEqual_WhenFiveIsMultipliedByTwoThenAddedToSixMltipliedByThree_ThenResultShouldBeTwentyeight() {
        calculator.addElement(number: 5)
        calculator.addOperator(calcOperator: "*")
        calculator.addElement(number: 2)
        calculator.addOperator(calcOperator: "+")
        calculator.addElement(number: 6)
        calculator.addOperator(calcOperator: "*")
        calculator.addElement(number: 3)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "28")
    }

    func testGivenPressingEqual_WhenTwoIsAddedToTwelveMultipliedByFifty_ThenResultShouldBeSixHundredAndOne() {
        calculator.addElement(number: 2)
        calculator.addOperator(calcOperator: "+")
        calculator.addElement(number: 12)
        calculator.addOperator(calcOperator: "*")
        calculator.addElement(number: 50)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "602")
    }

//    func testGivenPressingEqual_WhenTwelveIsMultipliedAndThenDividedByFive_ThenTheProgramShouldReturnAnError () {
//        calculator.addElement(number: 12)
//        calculator.addOperator(calcOperator: "*")
//        calculator.addOperator(calcOperator: "/")
//        calculator.addElement(number: 5)
//        calculator.tappedEqualButton()
//
//        XCTAssertThrowsError(try calculator.expressionIsCorrect)
//    }

    func testGivenUserPressingEqual_WhenTwoIsAddedToThreeEqualIsPressedThenTheOperationIsDoneAgain_ThenResultShouldBeFive() {
        calculator.addElement(number: 3)
        calculator.addOperator(calcOperator: "+")
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()
        calculator.addElement(number: 3)
        calculator.addOperator(calcOperator: "+")
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "5")
    }

    func testGivenUserPressingEqual_WhenTwoIsAddedToThreeEqualIsPressedThenTwoIsAdded_ThenResultShouldBeSeven() {
        calculator.addElement(number: 3)
        calculator.addOperator(calcOperator: "+")
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()
        calculator.addOperator(calcOperator: "+")
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "7")
    }
}
