//
//  colorbutton.swift
//  Lab3
//
//  Created by thalia on 9/26/16.
//  Copyright © 2016 thalia. All rights reserved.
//

import UIKit
class colorbutton: UIButton{
    @IBInspectable var colorFill: UIColor = UIColor.greenColor()
    override func drawRect(rect: CGRect) {
        let path=UIBezierPath(ovalInRect: rect)
        colorFill.setFill()
        path.fill()
    }
}
