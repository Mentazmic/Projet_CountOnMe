//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    var calculator: Calculator!

    var expressionHaveResult: Bool {
        return textView.text.firstIndex(of: "=") != nil
    }

    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        calculator = Calculator()
        self.textView.delegate = self
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Actions
    //IBAction for number key
    @IBAction private func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        if expressionHaveResult {
            textView.text = ""
        }
        
        textView.text.append(numberText)

        let numberTextToNumberInt = Int(numberText) ?? 0
        calculator.addElement(number: Double(numberTextToNumberInt))
    }
    //IBAction for "add" key
    @IBAction private func tappedAdditionButton(_ sender: UIButton) {
        do {
            try calculator.addOperator(calcOperator: "+")
            textView.text.append(" + ")
        } catch {
            let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    //IBAction for "subtract" key
    @IBAction private func tappedSubstractionButton(_ sender: UIButton) {
        do {
            try calculator.addOperator(calcOperator: "-")
            textView.text.append(" - ")
        } catch {
            let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    //IBAction for "multiply" key
    @IBAction private func tappedMultiplicationButton(_ sender: UIButton) {
        do {
            try calculator.addOperator(calcOperator: "*")
            textView.text.append(" * ")
        } catch {
            let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    //IBAction for "divide" key
    @IBAction private func tappedDivisionButton(_ sender: UIButton) {
        do {
            try calculator.addOperator(calcOperator: "/")
            textView.text.append(" / ")
        } catch {
            let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    //IBAction for "equal" key
    @IBAction private func tappedEqualButton(_ sender: UIButton) {
        do {
            try calculator.tappedEqualButton()
            textView.text.append(" = \(calculator.finalResult)")
        } catch Calculator.CalcError.notEnoughElements {
            let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        } catch Calculator.CalcError.expressionIsIncorrect {
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        } catch {
            let alertVC = UIAlertController(title: "Zéro!", message: "Erreur", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func tappedCButton(_ sender: UIButton) {
        do {
            try calculator.tappedCancelButton()
            textView.text.removeAll()
        } catch {
            let alertVC = UIAlertController(title: "Zéro!", message: "Rien à corriger!", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
}


