//
//  ViewController.swift
//  Calculator
//
//  Created by Elif on 16.12.2019.
//  Copyright © 2019 Elif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Views
    @IBOutlet weak var zeroButtonTapped: UIButton!
    @IBOutlet weak var oneButtonTapped: UIButton!
    @IBOutlet weak var twoButtonTapped: UIButton!
    @IBOutlet weak var threeButtonTapped: UIButton!
    @IBOutlet weak var fourButtonTapped: UIButton!
    @IBOutlet weak var fiveButtonTapped: UIButton!
    @IBOutlet weak var sixButtonTapped: UIButton!
    @IBOutlet weak var sevenButtonTapped: UIButton!
    @IBOutlet weak var eightButtonTapped: UIButton!
    @IBOutlet weak var nineButtonTapped: UIButton!
    @IBOutlet weak var commaButtonTapped: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var equalButtonTapped: UIButton!
    @IBOutlet weak var sumButtonTapped: UIButton!
    @IBOutlet weak var minusButtonTapped: UIButton!
    @IBOutlet weak var multiplyButtonTapped: UIButton!
    @IBOutlet weak var divideButtonTapped: UIButton!
    @IBOutlet weak var percentButtonTapped: UIButton!
    @IBOutlet weak var negativeButtonTapped: UIButton!
    @IBOutlet weak var ACButtonTapped: UIButton!
    
    // MARK: - Variables
    var firstNumber = 0.0
    var secondNumber = 0.0
    var result = 0.0
    var negativeSign = Double()
    var otherNumber = false
    var selection = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApplyRoundCorner()
    }
    
    // MARK: - Events
    @IBAction func numbersButtonClicked(_ sender: UIButton) {
        //0-1-2-3-4-5-6-7-8-9 button'ları tanımlanmıştır.
        if otherNumber == false {
            if resultLabel.text == "0" {
                resultLabel.text = ""
                resultLabel.text = resultLabel.text! + String(sender.tag)
                firstNumber = Double(resultLabel.text ?? "") ?? 0
                ACButtonTapped.setTitle("C", for: .normal)
            }else {
                resultLabel.text = resultLabel.text! + String(sender.tag)
                firstNumber = Double(resultLabel.text ?? "") ?? 0
                ACButtonTapped.setTitle("C", for: .normal)
            }
        }else {
            if resultLabel.text == "0" {
                resultLabel.text = ""
                resultLabel.text = resultLabel.text! + String(sender.tag)
                secondNumber = Double(resultLabel.text ?? "") ?? 0
                ACButtonTapped.setTitle("C", for: .normal)
            }else{
                resultLabel.text = resultLabel.text! + String(sender.tag)
                secondNumber = Double(resultLabel.text ?? "") ?? 0
                ACButtonTapped.setTitle("C", for: .normal)
            }
        }
    }
    
    @IBAction func commaButtonTapped(_ sender: UIButton) {
        resultLabel.text = resultLabel.text! + "."
    }
    
    @IBAction func ACButtonTapped(_ sender: UIButton) {
        firstNumber = 0.0
        secondNumber = 0.0
        resultLabel.text = "0"
        ACButtonTapped.setTitle("AC", for: .normal)
    }
    
    @IBAction func negativeButtonTapped(_ sender: UIButton) {
        negativeSign = Double(resultLabel.text!)!
        negativeSign = negativeSign * (-1)
        resultLabel.text = String(negativeSign)
    }
    
    @IBAction func percentButtonTapped(_ sender: UIButton) {
        resultLabel.text = String(firstNumber / 100)
    }
    
    @IBAction func divideButtonTapped(_ sender: UIButton) {
        if otherNumber == false {
            otherNumber = true
            resultLabel.text = ""
        }else{
            resultLabel.text = ""
            doCalculation(x: firstNumber, y: secondNumber, op: .divide)
            firstNumber = result
        }
        selection = 2
    }
    
    @IBAction func multiplyButtonTapped(_ sender: UIButton) {
        if otherNumber == false {
            otherNumber = true
            resultLabel.text = ""
        }else{
            resultLabel.text = ""
            doCalculation(x: firstNumber, y: secondNumber, op: .multiply)
            firstNumber = result
        }
        selection = 1
    }
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        if otherNumber == false {
            otherNumber = true
            resultLabel.text = ""
        }else{
            resultLabel.text = ""
            doCalculation(x: firstNumber, y: secondNumber, op: .minus)
            firstNumber = result
        }
        selection = 4
    }
    
    @IBAction func sumButtonTapped(_ sender: UIButton) {
        if otherNumber == false {
            otherNumber = true
            resultLabel.text = ""
        }else{
            resultLabel.text = ""
            doCalculation(x: firstNumber, y: secondNumber, op: .sum)
            firstNumber = result
        }
        selection = 3
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        switch selection {
        case 1:
            doCalculation(x: firstNumber, y: secondNumber, op: .multiply)
        case 2:
            doCalculation(x: firstNumber, y: secondNumber, op: .divide)
        case 3:
            doCalculation(x: firstNumber, y: secondNumber, op: .sum)
        case 4:
            doCalculation(x: firstNumber, y: secondNumber, op: .minus)
        default:
            break
        }
        
        resultLabel.text = "\(result)"
        otherNumber = false
    }
    
    // MARK: - Enum
    enum Operator {
        case sum
        case minus
        case multiply
        case divide
    }
    
    // MARK: - Functions
    func applyRoundCorner(_ object: AnyObject){
        object.layer.cornerRadius = object.frame.size.width / 6
        object.layer.masksToBounds = true
    }
    
    func configureApplyRoundCorner(){
        self.applyRoundCorner(zeroButtonTapped)
        self.applyRoundCorner(oneButtonTapped)
        self.applyRoundCorner(twoButtonTapped)
        self.applyRoundCorner(threeButtonTapped)
        self.applyRoundCorner(fourButtonTapped)
        self.applyRoundCorner(fiveButtonTapped)
        self.applyRoundCorner(sixButtonTapped)
        self.applyRoundCorner(sevenButtonTapped)
        self.applyRoundCorner(eightButtonTapped)
        self.applyRoundCorner(nineButtonTapped)
        self.applyRoundCorner(commaButtonTapped)
        self.applyRoundCorner(equalButtonTapped)
        self.applyRoundCorner(sumButtonTapped)
        self.applyRoundCorner(minusButtonTapped)
        self.applyRoundCorner(multiplyButtonTapped)
        self.applyRoundCorner(divideButtonTapped)
        self.applyRoundCorner(ACButtonTapped)
        self.applyRoundCorner(negativeButtonTapped)
        self.applyRoundCorner(percentButtonTapped)
    }
    
    func doCalculation(x: Double, y: Double, op: Operator){
        switch op {
        case .sum:
            result = x + y
        case .minus:
            result = x - y
        case .multiply:
            result = x * y
        case .divide:
            result = x / y
        }
    }
}
