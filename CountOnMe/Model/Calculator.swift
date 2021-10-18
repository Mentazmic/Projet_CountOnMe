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


    // MARK: - Functions

    func addElement(number: Float) {

        let elementsStringToNumber = number.clean

        if elements.last == "+" || elements.last == "-" || elements.last == "*" || elements.last == "/" || elements.last == nil {
            elements.append(elementsStringToNumber)
        } else {
            let value1 = elements.last
            let value2 = elementsStringToNumber
            let finalValue = value1! + value2
            elements.removeLast()
            elements.append(finalValue)
        }

        // saisie opérateur : elements.last -> si opérateur -> erreur

        //        let elementsSplittedString = elementsStringToNumber.split(separator: "/", omittingEmptySubsequences: false)
        //        elements.append(elementsSplittedString)

    }
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "*" && elements.last != "/"
    }

    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }

    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "*" && elements.last != "/"
    }

    func addOperator(calcOperator: String) {
        if canAddOperator {
            elements.append(calcOperator)
        }
    }

    func tappedEqualButton() {

        // Create local copy of operations
        var operationsToReduce = elements

        while operationsToReduce.count > 1 {
            let left = Float(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Float(operationsToReduce[2])!

            let result: Float

            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "/": result = left / right
            case "*": result = left * right
            default: fatalError("Unknown operator !")
            }

            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }

        //Créer une fonction || extension de float qui renverrait un string
        let operationsValue = Float(operationsToReduce.first!)!

        result = operationsValue.clean
    }

    var result: String = "0"
}
// MARK: - Extension

extension Float {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
