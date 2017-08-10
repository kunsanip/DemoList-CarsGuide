//
//  PDExtentions.swift
//  DemoList
//
//  Created by Admin on 8/8/17.
//  Copyright © 2017 Sanip. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            if newValue <= 0 {
                return
            }
            self.layer.cornerRadius = newValue

        }
    }

    public func setCornerRadious(radious:CGFloat = 4)
    {
        self.layer.cornerRadius = radious 
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
    
 
    
}

