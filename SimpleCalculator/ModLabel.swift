//
//  ModLabel.swift
//  SimpleCalculator
//
//  Created by Sergey Sharipov on 23.09.17.
//  App for simple calc operations
//  Version 1.0
//  Copyright © 2017 Sergey Sharipov. All rights reserved.
//

import Foundation
import UIKit

//New class for buttons with shadow
class ModLabel: UILabel {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let shadowPath = UIBezierPath(rect: bounds)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowOpacity = 0.4
        layer.shadowPath = shadowPath.cgPath
    }
}
