//
//  ModLabel.swift
//  SimpleCalculator
//
//  Created by Admin on 23.09.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import UIKit

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
