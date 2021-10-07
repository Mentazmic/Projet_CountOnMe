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
        let elementsStringToNumber = String(number)

        // Pour "testGivenUserPressingEqual_WhenTwoIsMultipliedByTen_ThenResultShouldBeTwenty()"

        // elements.last -> vérifier si c'est un opérateur (condition) -> element.append sur saisie
        // else:
        // stocker le 1 et 0 dans une variable intermediaire
        // elements.last + elementsStringToNumber
        // effacer le 1 de la liste
        // ajouter le 10 à la liste

        // saisie opérateur : elements.last -> si opérateur -> erreur

        //        let elementsSplittedString = elementsStringToNumber.split(separator: "+", omittingEmptySubsequences: false)
        //        elements.append(elementsSplittedString)
        elements.append(elementsStringToNumber)
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

        //Créer une fonction || extension de float qui renverrait un string
        let operationsValue = Float(operationsToReduce.first!)!

        var formattedValue = String(format: "%.5f", operationsValue)

        while formattedValue.last == "0" {
            formattedValue.removeLast()
        }
        if formattedValue.last == "." {
            formattedValue.removeLast()
        }

        result = formattedValue

    }

    var result: String = "0"
}
