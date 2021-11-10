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
    var expressionIsIncorrect: Bool = false
    var notEnoughElements: Bool = false
    var divisionByZero: Bool = false
    var caughtAnError: Bool = false

    // MARK: - Setup

    override func setUp() {
        super.setUp()
        calculator = Calculator()
        expressionIsIncorrect = false
        notEnoughElements = false
        divisionByZero = false
        caughtAnError = false
    }

    // MARK: - Helpers


    // MARK: - Tests

    func testGivenUserPressingEqual_WhenTwoIsAddedToThree_ThenResultShouldBeFive() {
        do {
            calculator.addElement(number: 3)
            try calculator.addOperator(calcOperator: "+")
            calculator.addElement(number: 2)
            try calculator.tappedEqualButton()
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        XCTAssertEqual(calculator.finalResult, "5")
        XCTAssertTrue(calculator.expressionIsCorrect)
    }

    func testGivenUserPressingEqual_WhenTenIsDividedByTwo_ThenResultShouldBeFive() {
        do {
            calculator.addElement(number: 1)
            calculator.addElement(number: 0)
            try calculator.addOperator(calcOperator: "/")
            calculator.addElement(number: 2)
            try calculator.tappedEqualButton()
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        XCTAssertEqual(calculator.finalResult, "5")
        XCTAssertTrue(calculator.expressionIsCorrect)
        XCTAssertFalse(calculator.checkOperator)
        XCTAssertFalse(caughtAnError)
    }

    func testGivenUserPressingEqual_WhenTwoIsMultipliedByTen_ThenResultShouldBeTwenty() {
        do {
            calculator.addElement(number: 2)
            try calculator.addOperator(calcOperator: "*")
            calculator.addElement(number: 10)
            try calculator.tappedEqualButton()
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        XCTAssertEqual(calculator.finalResult, "20")
        XCTAssertTrue(calculator.expressionIsCorrect)
        XCTAssertFalse(caughtAnError)
    }

    func testGivenUserPressingEqual_WhenTenThousandIsMultipliedByFiveHundred_ThenResultShouldBeFiveMillions() {
        do {
            calculator.addElement(number: 100000000)
            try calculator.addOperator(calcOperator: "*")
            calculator.addElement(number: 500)
            try calculator.tappedEqualButton()
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        XCTAssertTrue(calculator.expressionIsCorrect)
        XCTAssertEqual(calculator.finalResult, "50000000000")
    }

    func testGivenUserPressingEqual_WhenTenIsAddedToSeventyNineAndAddedToThirtyOne_ThenResultShouldBeAHundredAndTwenty() {
        do {
            calculator.addElement(number: 10)
            try calculator.addOperator(calcOperator: "+")
            calculator.addElement(number: 31)
            try calculator.tappedEqualButton()
            try calculator.addOperator(calcOperator: "+")
            calculator.addElement(number: 79)
            try calculator.tappedEqualButton()
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        XCTAssertFalse(calculator.checkOperator)
        XCTAssertTrue(calculator.expressionIsCorrect)
        XCTAssertEqual(calculator.finalResult, "120")
        XCTAssertFalse(caughtAnError)
    }

    func testGivenUserPressingEqual_WhenTenIsAddedToSeventyNineAndAddedToThirtyOneThenSubstractThirty_ThenResultShouldBeNinety() {
        do {
            calculator.addElement(number: 10)
            try calculator.addOperator(calcOperator: "+")
            calculator.addElement(number: 79)
            try calculator.addOperator(calcOperator: "+")
            calculator.addElement(number: 31)
            try calculator.addOperator(calcOperator: "-")
            calculator.addElement(number: 30)
            try calculator.tappedEqualButton()
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch Calculator.CalcError.notEnoughElements {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        XCTAssertTrue(calculator.expressionIsCorrect)
        XCTAssertEqual(calculator.finalResult, "90")
        XCTAssertFalse(caughtAnError)
    }

    func testGivenUserPressingEqual_WhenSeventyFiveIsMultipliedByThirtyAndMultipliedByAHundred_ThenResultShouldBeFourThousandAndFiveHundred() {
        do {
            calculator.addElement(number: 75)
            try calculator.addOperator(calcOperator: "*")
            calculator.addElement(number: 30)
            try calculator.addOperator(calcOperator: "*")
            calculator.addElement(number: 2)
            try calculator.tappedEqualButton()
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        XCTAssertTrue(calculator.expressionIsCorrect)
        XCTAssertEqual(calculator.finalResult, "4500")
    }

    func testGivenUserPressingEqual_WhenFiveIsDividedByTwo_ThenResultShouldBeTwoAndAHalf() {
        calculator.addElement(number: 5)
        do {
            try calculator.addOperator(calcOperator: "/")
            calculator.addElement(number: 2)
            try calculator.tappedEqualButton()
        }  catch {
            print("Caught an error")
            caughtAnError = true
        }
        XCTAssertTrue(calculator.expressionIsCorrect)
        XCTAssertEqual(calculator.finalResult, "2.5")
        XCTAssertFalse(caughtAnError)
    }

    func testGivenUserPressingEqual_WhenFiveIsMultipliedByTwoThenDividedByTwo_ThenResultShouldBeFive() {
        do {
            calculator.addElement(number: 5)
            try calculator.addOperator(calcOperator: "*")
            calculator.addElement(number: 2)
            try calculator.addOperator(calcOperator: "/")
            calculator.addElement(number: 2)
            try calculator.tappedEqualButton()
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        XCTAssertTrue(calculator.expressionIsCorrect)
        XCTAssertEqual(calculator.finalResult, "5")
        XCTAssertFalse(caughtAnError)
    }

    func testGivenUserPressingEqual_WhenFiveIsMultipliedByTwoThenAddedToSixMltipliedByThree_ThenResultShouldBeTwentyeight() {
        calculator.addElement(number: 5)
        do {
            try calculator.addOperator(calcOperator: "*")
            calculator.addElement(number: 2)
            try calculator.addOperator(calcOperator: "+")
            calculator.addElement(number: 6)
            try calculator.addOperator(calcOperator: "*")
            calculator.addElement(number: 3)
            try calculator.tappedEqualButton()
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        XCTAssertTrue(calculator.expressionIsCorrect)
        XCTAssertEqual(calculator.finalResult, "28")
        XCTAssertFalse(caughtAnError)
    }

    func testGivenPressingEqual_WhenThereAreNegativeResultsAndPriorites_ThenResultShouldBeNegative() {
        do {
            calculator.addElement(number: 2)
            try calculator.addOperator(calcOperator: "-")
            calculator.addElement(number: 12)
            try calculator.addOperator(calcOperator: "*")
            calculator.addElement(number: 50)
            try calculator.tappedEqualButton()
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        XCTAssertEqual(calculator.finalResult, "-598")
        XCTAssertTrue(calculator.expressionIsCorrect)
        XCTAssertFalse(caughtAnError)
    }

    func testGivenUserPressingEqual_WhenAnOperationIsDoneAfterAnOther_ThenResultShouldBeFive() {
        do {
            calculator.addElement(number: 3)
            try calculator.addOperator(calcOperator: "+")
            calculator.addElement(number: 2)
            try calculator.tappedEqualButton()
            calculator.addElement(number: 3)
            try calculator.addOperator(calcOperator: "+")
            calculator.addElement(number: 2)
            try calculator.tappedEqualButton()
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        XCTAssertEqual(calculator.finalResult, "5")
        XCTAssertFalse(caughtAnError)
        XCTAssertFalse(calculator.isOperationStillRunning)
    }

    func testGivenUserPressingEqual_WhenTwoIsAddedToAnOngoingOperation_ThenResultShouldBeSeven() {
        do {
            calculator.addElement(number: 3)
            try calculator.addOperator(calcOperator: "+")
            calculator.addElement(number: 2)
            try calculator.tappedEqualButton()
            try calculator.addOperator(calcOperator: "+")
            calculator.addElement(number: 2)
            try calculator.tappedEqualButton()
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        XCTAssertTrue(calculator.expressionIsCorrect)
        XCTAssertEqual(calculator.finalResult, "7")
        XCTAssertFalse(caughtAnError)
        XCTAssertTrue(calculator.isOperationStillRunning)
    }

    func testGivenPressingEqual_WhenTwoOperatorsAreAdded_ThenTheProgramShouldReturnAnError () {
        do {
            calculator.addElement(number: 12)
            try calculator.addOperator(calcOperator: "*")
            try calculator.addOperator(calcOperator: "/")
            calculator.addElement(number: 12)
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            expressionIsIncorrect = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        XCTAssertTrue(expressionIsIncorrect)
    }

    func testGivenPressingEqual_WhenTheresNotEnoughElementsAddition_ThenTheProgramShouldReturnAnError () {
        do {
            calculator.addElement(number: 365)
            try calculator.addOperator(calcOperator: "+")
            calculator.addElement(number: 2454)
            try calculator.tappedEqualButton()
            try calculator.addOperator(calcOperator: "+")
            try calculator.tappedEqualButton()
            calculator.addElement(number: 2)
            try calculator.tappedEqualButton()
        } catch Calculator.CalcError.notEnoughElements {
            print("Caught an error: expression is incorrect")
            notEnoughElements = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        XCTAssertTrue(notEnoughElements)
    }

    func testGivenPressingEqual_WhenTheresNotEnoughElementsMultiplication_ThenTheProgramShouldReturnAnError () {
        do {
            calculator.addElement(number: 3)
            try calculator.addOperator(calcOperator: "+")
            calculator.addElement(number: 2)
            try calculator.tappedEqualButton()
            try calculator.addOperator(calcOperator: "*")
            try calculator.tappedEqualButton()
            calculator.addElement(number: 2)
            try calculator.tappedEqualButton()
        } catch Calculator.CalcError.expressionIsIncorrect {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch Calculator.CalcError.notEnoughElements {
            print("Caught an error: expression is incorrect")
            caughtAnError = true
        } catch {
            print("Caught an error")
            caughtAnError = true
        }
        XCTAssertTrue(caughtAnError)
        XCTAssertTrue(calculator.checkOperator)
    }

    func testGivenPressingEqual_WhenANumberIsDividedByZero_ThenProgramShouldReturnError () {
        do {
            calculator.addElement(number: 16)
            try calculator.addOperator(calcOperator: "/")
            calculator.addElement(number: 0)
            try calculator.tappedEqualButton()
        } catch Calculator.CalcError.divisionByZero {
            print("Caught an error: divisionByZero")
            divisionByZero = true
        } catch {
            print("Caught an error")
            caughtAnError = false
        }
        XCTAssertTrue(divisionByZero)
    }
}
