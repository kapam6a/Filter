//
//  File.swift
//  Filter
//
//  Created by admin5 on 16.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class TextFieldWithFixedRightView: UITextField {
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.width - 11,
                      y: bounds.height / 2 - 11 / 2,
                      width: 11,
                      height:11)
    }
}
