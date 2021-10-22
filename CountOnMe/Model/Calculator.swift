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

    var finalResult: String = "0"
    var emptyArrayTotal : String = ""
    var equalIsPressed: Bool = false


    // MARK: - Functions

    func addElement(number: Float) {
        
        let elementsStringToNumber = number.clean
        emptyArray()

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
        emptyArray()
        if canAddOperator {
            elements.append(calcOperator)
        }
    }

    func calcMultiplicativeGroup {

    }

    func calcAdditiveGroup {

    }

    func tappedEqualButton() {

        // Create local copy of operations
        var operationsToReduce = elements

        var total : Float = 0

        var leftIndex = 0
        var operatorIndex = 1
        var rightIndex = 2

        while rightIndex < operationsToReduce.count {
            // Le checker sert à vérifier si l'opération est une multiplication, une division ou non
            var priorityChecker = false

            let left = Float(operationsToReduce[leftIndex])!
            let operand = operationsToReduce[operatorIndex]
            let right = Float(operationsToReduce[rightIndex])!

            //Vérifier si les index impairs contiennent un operateur


            var result: Float = 0
            switch operand {
            case "/": result = left / right
            case "*": result = left * right
            default : priorityChecker = true
                break
            }
            // Si l'opération n'est pas une multiplication ou une division on incrémente les index de deux de sorte à ce qu'à la prochaine boucle on commence deux crans plus loin
            if priorityChecker {
                leftIndex += 2
                operatorIndex += 2
                rightIndex += 2
                priorityChecker = false
            } else {
                // Pour supprimer l'opération en cours en un résultat d'une multiplication ou d'une division on supprime l'opérateur et le deuxième terme puis on transformer le premier terme par le resultat.
                operationsToReduce.remove(at: rightIndex)
                operationsToReduce.remove(at: operatorIndex)
                operationsToReduce[leftIndex] = result.clean
            }
        }
        // A la fin de la boucle on se retrouve avec une formule sans multiplication ni division

        //Si le tableau ne possède qu'un seul élément, on définit le total ici
        if operationsToReduce.count == 1 {
            total = Float(operationsToReduce[0])!
        }

        // On entame le calcul des opérations et des soustractions
        while operationsToReduce.count > 1 {
            
            let left = Float(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Float(operationsToReduce[2])!

            var result: Float = 0
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            default: fatalError("Unknown operator !")
            }
            // Total va récupérer l'ensemble des résultats et les additionner.

            operationsToReduce = Array(operationsToReduce.dropFirst(2))
            operationsToReduce[0] = result.clean
            total = result
            emptyArrayTotal = String(result)
        }
        finalResult = total.clean
        equalIsPressed = true
    }

    //Si le prochain input après un calcul est un chiffre, vider le tableau, sinon continuer
    func emptyArray() {
        while equalIsPressed == true {
            if elements.last != "+" && elements.last != "-" && elements.last != "*" && elements.last != "/"{
                elements.removeAll()
                equalIsPressed = false
            } else {
                elements.removeAll()
                elements.append(emptyArrayTotal)
                equalIsPressed = false
            }
        }
    }
}
// MARK: - Extension

extension Float {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

