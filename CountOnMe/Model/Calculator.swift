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
    var elements: [String] = []

    var result: Float = 0
    var total : Float = 0
    var finalResult: String = "0"
    var leftIndex = 0
    var operatorIndex = 1
    var rightIndex = 2

    var equalIsPressed: Bool = false
    var isOperationStillRunning: Bool = false
    var lastElementIsAnOperator: Bool = false

    // MARK: - Checkers
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "*" && elements.last != "/"
    }

    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }

    var canAddOperator: Bool{
        continueOperation()
        return elements.last != "+" && elements.last != "-" && elements.last != "*" && elements.last != "/"
    }

    var checkOperator: Bool {
        if elements.last == "+" || elements.last == "-" || elements.last == "*" || elements.last == "/" {
            return true
        } else {
            return false
        }
    }

    private func preventDivisionByZero() throws {
        if elements[operatorIndex] == "/" && elements[rightIndex] == "0" || elements[leftIndex] == "0" {
                throw CalcError.divisionByZero
        }
    }

    enum CalcError: Error {
        case notEnoughElements
        case expressionIsIncorrect
        case divisionByZero
    }


    // MARK: - Functions
    func addElement(number: Float) {
        
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

    func addOperator(calcOperator: String) throws {
        if canAddOperator {
            elements.append(calcOperator)
        } else {
            throw CalcError.expressionIsIncorrect
        }
    }

    private func defineTotalIfElementsContainsOneEntry() {
        if elements.count == 1 {
            total = Float(elements[0])!
        }
    }

    //Si le prochain input après un calcul est un chiffre, vider le tableau, sinon continuer
    private func checkIfNextInputIsANumberAfterOperationIsDone() {
        while equalIsPressed == true {
            if elements.last != "+" && elements.last != "-" && elements.last != "*" && elements.last != "/"{
                elements.removeAll()
                equalIsPressed = false
                isOperationStillRunning = false
            }
        }
    }

    private func continueOperation() {
        while equalIsPressed == true {
            if elements.last != "+" && elements.last != "-" && elements.last != "*" && elements.last != "/"{
                equalIsPressed = false
                isOperationStillRunning = true
            }
        }
    }

    private func calcMultiplicativeGroup() throws {
        if expressionHaveEnoughElement {
            while rightIndex < elements.count {
                var isNextOperatorFromMultiplicativeGroup = false
                let left = Float(elements[leftIndex])!
                let operand = elements[operatorIndex]
                let right = Float(elements[rightIndex])!

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

    private func calcAdditiveGroup() throws {
        if expressionHaveEnoughElement {
            while elements.count > 1 {
                let left = Float(elements[0])!
                let operand = elements[1]
                let right = Float(elements[2])!
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

    func tappedEqualButton() throws {
        try calcMultiplicativeGroup()
        defineTotalIfElementsContainsOneEntry()
        try calcAdditiveGroup()
        finalResult = total.clean
        equalIsPressed = true
    }
}
// MARK: - Extension

extension Float {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
