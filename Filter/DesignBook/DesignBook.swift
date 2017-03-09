//
//  DesignBook.swift
//  Filter
//
//  Created by admin5 on 09.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

final class DesignBook {
    final class Colors {
        static let background = UIColor(red: 3 / 255.0, green: 26 / 255.0, blue: 189 / 255.0, alpha: 1.0)
        static let selected = UIColor.white
        static let primary = UIColor(red: 69 / 255.0, green: 192 / 255.0, blue: 241 / 255.0, alpha: 1.0)
        static let secondary = UIColor(red: 37 / 255.0, green: 115 / 255.0, blue: 191 / 255.0, alpha: 1.0)
    }
    
    final class Fonts {
        static let elevenSizeSystemFontMedium = UIFont.monospacedDigitSystemFont(ofSize: 11, weight: UIFontWeightMedium)
        static let tenSizeSystemFontMedium = UIFont.monospacedDigitSystemFont(ofSize: 11, weight: UIFontWeightMedium)
        static let thirteenSizeSystemFontMedium = UIFont.monospacedDigitSystemFont(ofSize: 13, weight: UIFontWeightMedium)
        static let tableViewFooterFont = UIFont.monospacedDigitSystemFont(ofSize: 13, weight: UIFontWeightMedium)
    }
}
