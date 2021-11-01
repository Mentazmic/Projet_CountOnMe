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
    var caughtAnError: Bool = false

    // MARK: - Setup

    override func setUp() {
        super.setUp()
        calculator = Calculator()
        caughtAnError = false
    }

    // MARK: - Helpers


    // MARK: - Tests

    func testGivenUserPressingEqual_WhenTwoIsAddedToThree_ThenResultShouldBeFive() {
        calculator.addElement(number: 3)
        do {
            try calculator.addOperator(calcOperator: "+")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "5")
    }

    func testGivenUserPressingEqual_WhenTenIsDividedByTwo_ThenResultShouldBeFive() {
        calculator.addElement(number: 10)
        do {
            try calculator.addOperator(calcOperator: "/")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "5")
        XCTAssertFalse(caughtAnError)
    }

    func testGivenUserPressingEqual_WhenTwoIsMultipliedByTen_ThenResultShouldBeTwenty() {
        calculator.addElement(number: 2)
        do {
            try calculator.addOperator(calcOperator: "*")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 1)
        calculator.addElement(number: 0)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "20")
        XCTAssertFalse(caughtAnError)
    }

    func testGivenUserPressingEqual_WhenTenThousandIsMultipliedByFiveHundred_ThenResultShouldBeFiveMillions() {
        calculator.addElement(number: 10000000)
        do {
            try calculator.addOperator(calcOperator: "*")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 500)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "5000000000")
    }

    func testGivenUserPressingEqual_WhenTenIsAddedToSeventyNineAndAddedToThirtyOne_ThenResultShouldBeAHundredAndTwenty() {
        calculator.addElement(number: 10)
        do {
            try calculator.addOperator(calcOperator: "+")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 79)
        do {
            try calculator.addOperator(calcOperator: "+")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 31)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "120")
        XCTAssertFalse(caughtAnError)
    }

    func testGivenUserPressingEqual_WhenTenIsAddedToSeventyNineAndAddedToThirtyOneThenSubstractThirty_ThenResultShouldBeNinety() {
        calculator.addElement(number: 10)
        do {
            try calculator.addOperator(calcOperator: "+")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 79)
        do {
            try calculator.addOperator(calcOperator: "+")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 31)
        do {
            try calculator.addOperator(calcOperator: "-")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 30)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "90")
        XCTAssertFalse(caughtAnError)
    }

    func testGivenUserPressingEqual_WhenSeventyFiveIsMultipliedByThirtyAndMultipliedByAHundred_ThenResultShouldBeFourThousandAndFiveHundred() {
        calculator.addElement(number: 75)
        do {
            try calculator.addOperator(calcOperator: "*")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 30)
        do {
            try calculator.addOperator(calcOperator: "*")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "4500")
    }

    func testGivenUserPressingEqual_WhenFiveIsDividedByTwo_ThenResultShouldBeTwoAndAHalf() {
        calculator.addElement(number: 5)
        do {
            try calculator.addOperator(calcOperator: "/")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "2.5")
        XCTAssertFalse(caughtAnError)
    }

    func testGivenUserPressingEqual_WhenFiveIsMultipliedByTwoThenDividedByTwo_ThenResultShouldBeFive() {
        calculator.addElement(number: 5)
        do {
            try calculator.addOperator(calcOperator: "*")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 2)
        do {
            try calculator.addOperator(calcOperator: "/")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "5")
        XCTAssertFalse(caughtAnError)
    }

    func testGivenUserPressingEqual_WhenFiveIsMultipliedByTwoThenAddedToSixMltipliedByThree_ThenResultShouldBeTwentyeight() {
        calculator.addElement(number: 5)
        do {
            try calculator.addOperator(calcOperator: "*")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 2)
        do {
            try calculator.addOperator(calcOperator: "+")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 6)
        do {
            try calculator.addOperator(calcOperator: "*")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 3)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "28")
        XCTAssertFalse(caughtAnError)
    }

    func testGivenPressingEqual_WhenThereAreNegativeResultsAndPriorites_ThenResultShouldBeNegative() {
        calculator.addElement(number: 2)
        try? calculator.addOperator(calcOperator: "-")
        calculator.addElement(number: 12)
        try? calculator.addOperator(calcOperator: "*")
        calculator.addElement(number: 50)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "-598")
        XCTAssertFalse(caughtAnError)
    }

    func testGivenUserPressingEqual_WhenAnOperationIsDoneAfterAnOther_ThenResultShouldBeFive() {
        calculator.addElement(number: 3)
        do {
            try calculator.addOperator(calcOperator: "+")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()
        calculator.addElement(number: 3)
        do {
            try calculator.addOperator(calcOperator: "+")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "5")
        XCTAssertFalse(caughtAnError)
    }

    func testGivenUserPressingEqual_WhenTwoIsAddedToAnOngoingOperation_ThenResultShouldBeSeven() {
        calculator.addElement(number: 3)
        do {
            try calculator.addOperator(calcOperator: "+")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()
        do {
            try calculator.addOperator(calcOperator: "+")
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        calculator.addElement(number: 2)
        calculator.tappedEqualButton()

        XCTAssertEqual(calculator.finalResult, "7")
        XCTAssertFalse(caughtAnError)
    }

    func testGivenPressingEqual_WhenTwelveIsMultipliedAndThenDividedByFive_ThenTheProgramShouldReturnAnError () {
        calculator.addElement(number: 12)
        do {
            try calculator.addOperator(calcOperator: "*")
            try calculator.addOperator(calcOperator: "/")
            calculator.addElement(number: 12)
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        XCTAssertTrue(caughtAnError)
    }

//    func testGivenPressingEqual_WhenTheresNotEnoughElements_ThenTheProgramShouldReturnAnError () {
//        calculator.addElement(number: 12)
//        do {
//            try calculator.addOperator(calcOperator: "-")
//        } catch Calculator.CalcError.expressionIsIncorrect {
//            print("Caught an error: expression is incorrect")
//            caughtAnError = true
//        } catch {
//            print("Caught an error")
//            caughtAnError = true
//        }
//        do {
//            try calculator.tappedEqualButton()
//            calculator.addElement(number: 12)
//        } catch Calculator.CalcError.notEnoughElements {
//            print("Caught an error: not enough elements")
//            caughtAnError = true
//        } catch {
//            print("Caught an error")
//            caughtAnError = true
//        }
//        XCTAssertTrue(caughtAnError)
//    }
}
