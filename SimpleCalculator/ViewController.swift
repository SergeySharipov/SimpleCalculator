//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Admin on 20.09.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var temp=0
    
    @IBAction func onClickNumbers(_ sender: UIButton) {
        resultLabel.text=sender.titleLabel?.text
        
        let a = Int((sender.titleLabel?.text)!)
        
        if(temp==0){
            temp = a!
        } else {
            resultLabel.text=String(a!+temp)
            temp = 0
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

