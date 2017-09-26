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
        switch sender {
        case butPercent:
            resultLabel.text = resultLabel.text! + (percent)
            break
        case butPlusMinus:
            resultLabel.text = String(getCurrentValue() * -1.0)
            break
        case butPoint:
            resultLabel.text = resultLabel.text! + (point)
            break
        case butEquals:
            equalsOp()
            temp = Double.greatestFiniteMagnitude
            tempMathOperation = empty
            break
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
        var pressed = false
        
        if (temp == Double.greatestFiniteMagnitude) {
            temp = getCurrentValue()
        } else {
            equalsOp()
        }
        switch sender {
        case butPlus:
            tempMathOperation = plus
            pressed = true
            break
        case butMinus:
            tempMathOperation = minus
            pressed = true
            break
        case butDivide:
            tempMathOperation = divide
            pressed = true
            break
        case butMultiply:
            tempMathOperation = multiply
            pressed = true
            break
        default:
            break
        }
        
        resultLabel.text = empty
        
    }

    private func clean() {
    temp = Double.greatestFiniteMagnitude
    temp2 = Double.greatestFiniteMagnitude
    tempMathOperation = empty
    resultLabel.text = empty
    }
    
    private func equalsOp() {
        
        temp2 = getCurrentValue()
        
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
            if (temp != Double.greatestFiniteMagnitude) {
                resultLabel.text = String(temp)
            } else if (temp2 != Double.greatestFiniteMagnitude) {
                resultLabel.text = String(temp2)
            } else{
                resultLabel.text = empty
            }
            break
        }
        
    resultLabel.text = String(temp)
    temp2 = Double.greatestFiniteMagnitude
    }
    
    func getCurrentValue() -> Double {
    var a: Double
        
        do {
            a = try Double(resultLabel.text!)!
        } catch {
            a = Double.greatestFiniteMagnitude
            clean()
        }
   
    return a
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
