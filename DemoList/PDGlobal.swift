//
//  PDGlobal.swift
//  Demolist
//
//  Created by Admin on 8/8/17.
//  Copyright © 2017 Sanip. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

// MARK: - Global Variables

// MARK: - Messages



public func Loading(string: String?, maskType: SVProgressHUDMaskType = SVProgressHUDMaskType.black) {
    SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
    SVProgressHUD.show(withStatus: string  ?? "")
    //SVProgressHUD.show(withStatus: string!, maskType: maskType)
}

