//
//  Calculator.swift
//  CountOnMe
//
//  Created by Maxime Landu-Wa on 23/09/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculator {
    // MARK: - Properties
    //contains every number and operators
    var elements: [String] = []

    //intermediate values for each operation
    var result: Double = 0
    var total : Double = 0

    //final value of an operation
    var finalResult: String = "0"

    //used to browse the array for the multiplicative group
    var leftIndex = 0
    var operatorIndex = 1
    var rightIndex = 2

    //has the equal been pressed?
    var equalIsPressed: Bool = false
    //is the operation still running?
    var isOperationStillRunning: Bool = false
    //is the last index of elements an operator?
    var lastElementIsAnOperator: Bool = false

    // MARK: - Checkers
    //checks if the expression is valid
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "*" && elements.last != "/"
    }
    //checks if there's enough elements to do an operation
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    //checks if an operator can be added
    var canAddOperator: Bool{
        continueOperation()
        return elements.last != "+" && elements.last != "-" && elements.last != "*" && elements.last != "/"
    }
    //checks if the last item of elements is an operator
    var checkOperator: Bool {
        if elements.last == "+" || elements.last == "-" || elements.last == "*" || elements.last == "/" {
            return true
        } else {
            return false
        }
    }
    //prevents any division by zero
    private func preventDivisionByZero() throws {
        if elements[operatorIndex] == "/" && elements[rightIndex] == "0" || elements[leftIndex] == "0" {
                throw CalcError.divisionByZero
        }
    }
    //error cases
    enum CalcError: Error {
        case notEnoughElements
        case expressionIsIncorrect
        case divisionByZero
    }


    // MARK: - Functions
    //adds a number to the array
    func addElement(number: Double) {
        
        let elementsStringToNumber = number.clean
        checkIfNextInputIsANumberAfterOperationIsDone()

        if elements.last == "+" || elements.last == "-" || elements.last == "*" || elements.last == "/" || elements.last == nil {
            elements.append(elementsStringToNumber)
        } else {
            let value1 = elements.last
            let value2 = elementsStringToNumber
            let finalValue = value1! + value2
            elements.removeLast()
            elements.append(finalValue)
        }
    }
    //adds an operator to the array
    func addOperator(calcOperator: String) throws {
        if canAddOperator {
            elements.append(calcOperator)
        } else {
            throw CalcError.expressionIsIncorrect
        }
    }
    //checks if elements contains only one element, and applies it's value to total
    private func defineTotalIfElementsContainsOneEntry() {
        if elements.count == 1 {
            total = Double(elements[0])!
        }
    }

    //checks if the next input after an operation is a number. Empties the array if so.
    private func checkIfNextInputIsANumberAfterOperationIsDone() {
        while equalIsPressed == true {
            if elements.last != "+" && elements.last != "-" && elements.last != "*" && elements.last != "/"{
                elements.removeAll()
                equalIsPressed = false
                isOperationStillRunning = false
            }
        }
    }
    //checks if the user continues to operate after pressing equal
    private func continueOperation() {
        while equalIsPressed == true {
            if elements.last != "+" && elements.last != "-" && elements.last != "*" && elements.last != "/"{
                equalIsPressed = false
                isOperationStillRunning = true
            }
        }
    }
    //processes all operations from additive group
    private func calcMultiplicativeGroup() throws {
        if expressionHaveEnoughElement {
            while rightIndex < elements.count {
                var isNextOperatorFromMultiplicativeGroup = false
                let left = Double(elements[leftIndex])!
                let operand = elements[operatorIndex]
                let right = Double(elements[rightIndex])!

                //checks if a value is divided by zero
                try preventDivisionByZero()

                switch operand {
                case "/": result = left / right
                case "*": result = left * right
                default : isNextOperatorFromMultiplicativeGroup = true
                    break
                }
                if isNextOperatorFromMultiplicativeGroup {
                    leftIndex += 2
                    operatorIndex += 2
                    rightIndex += 2
                    isNextOperatorFromMultiplicativeGroup = false
                } else {
                    elements.remove(at: rightIndex)
                    elements.remove(at: operatorIndex)
                    elements[leftIndex] = result.clean
                }
            }
        } else {
            throw CalcError.notEnoughElements
        }
    }
    //processes all operations from additive group
    private func calcAdditiveGroup() throws {
        if expressionHaveEnoughElement {
            while elements.count > 1 {
                let left = Double(elements[0])!
                let operand = elements[1]
                let right = Double(elements[2])!
                //var result: Float = 0

                switch operand {
                case "+": result = left + right
                case "-": result = left - right
                default: break
                }

                elements = Array(elements.dropFirst(2))
                elements[0] = result.clean
                total = result
            }
        } else {
            if checkOperator {
                throw CalcError.notEnoughElements
            }
        }
    }
    //when user taps equal button
    func tappedEqualButton() throws {
        try calcMultiplicativeGroup()
        defineTotalIfElementsContainsOneEntry()
        try calcAdditiveGroup()
        finalResult = total.clean
        equalIsPressed = true
    }
}
// MARK: - Extension

//truncates decimals if needed
extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
