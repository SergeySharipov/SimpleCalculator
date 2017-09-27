//
//  ModButton.swift
//  SimpleCalculator
//
//  Created by Sergey Sharipov on 23.09.17.
//  Student id: 300961984
//  App for simple calc operations
//  Version 1.0
//  Copyright © 2017 Sergey Sharipov. All rights reserved.
//

import Foundation
import UIKit

//New class for buttons with shadow
class ModButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let shadowPath = UIBezierPath(rect: bounds)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
    
        //Different shadow opacity for different orientation
        if (UIDevice.current.orientation.isPortrait){
            layer.shadowOpacity = 0.4
        } else{
            layer.shadowOpacity = 0.3
        }
        
        layer.shadowPath = shadowPath.cgPath
        
    }
}
