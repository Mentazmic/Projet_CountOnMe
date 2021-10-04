//
//  Calculator.swift
//  CountOnMe
//
//  Created by Maxime Landu-Wa on 23/09/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculator {

    var elements: [String] = []

    func addElement(number: Int) {

        //int to string
        let elementStringToNumber = String(number)
        elements.append(elementStringToNumber)
    }

    func addOperator(calcOperator: String) {
        elements.append(calcOperator)
    }

    
    func tappedEqualButton() {

        // Create local copy of operations
        var operationsToReduce = elements

        while operationsToReduce.count > 1 {
            let left = Int(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Int(operationsToReduce[2])!

            let result: Int
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

        //string to float
        let operationsStringToFloat = operationsToReduce.first!
        result = Float(operationsStringToFloat)!
    }


    var result: Float = 0
}
