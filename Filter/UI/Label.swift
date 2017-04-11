//
//  File.swift
//  Filter
//
//  Created by admin5 on 04.04.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class Label: UILabel {
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
}
