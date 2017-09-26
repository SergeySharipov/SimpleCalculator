//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Admin on 20.09.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let plus: String = "+"
    private let minus: String = "-"
    private let multiply: String = "*"
    private let divide: String = "/"
    private let percent: String = "%"
    private let plusMinus: String = "+/-"
    private let equals: String = "="
    private let point: String = "."
    private let empty: String = ""
    
    private var temp: Double = Double.greatestFiniteMagnitude
    private var temp2: Double = Double.greatestFiniteMagnitude
    private var tempMathOperation: String = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var butDivide: UIButton!
    @IBOutlet weak var butMultiply: UIButton!
    @IBOutlet weak var butMinus: UIButton!
    @IBOutlet weak var butPlus: UIButton!
    
    @IBOutlet weak var butSquareRoot: UIButton!
    @IBOutlet weak var butPercent: UIButton!
    @IBOutlet weak var butDel: UIButton!
    @IBOutlet weak var butC: UIButton!
    @IBOutlet weak var butEquals: UIButton!
    @IBOutlet weak var butPlusMinus: UIButton!
    @IBOutlet weak var butPoint: UIButton!
    
    @IBAction func onClickNumbers(_ sender: UIButton) {
        resultLabel.text=resultLabel.text!.appending(sender.title(for: .normal)!)
    }
    
    @IBAction func onClickOtherOperations(_ sender: UIButton) {
        let currentValue: Double = getCurrentValue();
        
        if(currentValue != Double.greatestFiniteMagnitude){
            switch sender {
            case butPercent:
                percentage()
                break
            case butSquareRoot:
                resultLabel.text = String(sqrt(currentValue))
                break
            case butPlusMinus:
                if ((resultLabel.text?.characters.count)! > 0){
                    resultLabel.text = String(currentValue * -1.0)
                }
                break
            case butPoint:
                if(!(resultLabel.text?.contains("."))! && (resultLabel.text?.characters.count)! > 0){
                    resultLabel.text = resultLabel.text! + (point)
                }
                break
            case butEquals:
                equalsOp()
                temp = Double.greatestFiniteMagnitude
                tempMathOperation = empty
                break
            default:
                break
            }
        }
        
        switch sender {
        case butC:
            clean()
            break
        case butDel:
            if (resultLabel.text != empty){
                resultLabel.text!.remove(at: resultLabel.text!.index(before:resultLabel.text!.endIndex))
            }
            break
        default:
            break
        }
        
        
    }
    
    @IBAction func onClickMathOperations(_ sender: UIButton) {
        let currentValue: Double = getCurrentValue();
        
        if(currentValue != Double.greatestFiniteMagnitude){
            if (temp == Double.greatestFiniteMagnitude) {
                temp = currentValue
            } else {
                equalsOp()
            }
            switch sender {
            case butPlus:
                tempMathOperation = plus
                break
            case butMinus:
                tempMathOperation = minus
                break
            case butDivide:
                tempMathOperation = divide
                break
            case butMultiply:
                tempMathOperation = multiply
                break
            default:
                break
            }
            
            resultLabel.text = empty
        }
    }
    
    private func clean() {
        temp = Double.greatestFiniteMagnitude
        temp2 = Double.greatestFiniteMagnitude
        tempMathOperation = empty
        resultLabel.text = empty
    }
    
    private func equalsOp() {
        let currentValue: Double = getCurrentValue();
        
        if(currentValue != Double.greatestFiniteMagnitude){
            temp2 = currentValue
            
            switch tempMathOperation {
            case plus:
                temp = temp + temp2
                break
            case minus:
                temp = temp - temp2
                break
            case divide:
                temp = temp / temp2
                break
            case multiply:
                temp = temp * temp2
                break
            default:
                break
            }
            if(temp != Double.greatestFiniteMagnitude){
                resultLabel.text = String(temp)
                temp2 = Double.greatestFiniteMagnitude
            } else {
                //clean()
            }
        }
    }
    
    func percentage() {
        let currentValue: Double = getCurrentValue();
        
        if(currentValue != Double.greatestFiniteMagnitude){
            if temp == Double.greatestFiniteMagnitude {
                resultLabel.text = String(currentValue / 100)
            } else {
                resultLabel.text = String(temp * currentValue / 100)
            }
        }
    }
    
    func getCurrentValue() -> Double {
        if let a = Double(resultLabel.text!) {
            return a
        } else {
            return Double.greatestFiniteMagnitude
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
