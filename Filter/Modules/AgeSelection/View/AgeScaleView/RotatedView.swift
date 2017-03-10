//
//  File.swift
//  Filter
//
//  Created by admin5 on 10.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let buttonsNumber          = 100
    static let buttonWidth: CGFloat   = 20
    static let buttonHeight: CGFloat  = 10
    static let buttonPadding: CGFloat = 2
    static let lineWidth: CGFloat     = 2
}

class RotatedView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let radianForSection: CGFloat = CGFloat(2 * M_PI / Double(Constants.buttonsNumber))
        var startAngle: CGFloat = 0
        var endAngle = radianForSection
        
        for index in 1...Constants.buttonsNumber {
            path.addArc(withCenter: CGPoint(x: rect.width / 2, y: rect.height / 2),
                        radius: rect.width / 2  - Constants.buttonWidth / 2 - Constants.buttonPadding,
                        startAngle: startAngle,
                        endAngle: endAngle,
                        clockwise: true)
            
            let x = rect.width / 2 * cos(endAngle) + rect.width / 2
            
            let y = rect.width / 2 * sin(endAngle) + rect.height / 2
            
            let button = UIButton(frame: CGRect(x: 0,
                                                y: 0,
                                                width: Constants.buttonWidth,
                                                height: Constants.buttonWidth))
            button.center = CGPoint(x: x, y: y)
            
            button.transform = CGAffineTransform(rotationAngle: endAngle + CGFloat(M_PI))
            
            button.backgroundColor = .clear
            button.setTitle(String(index), for: .normal)
            button.setTitleColor(DesignBook.Colors.primary, for: .normal)
            button.titleLabel!.font = DesignBook.Fonts.elevenSizeSystemFontMedium
            
            addSubview(button)
            
            startAngle = endAngle
            endAngle = endAngle + radianForSection
        }
        
        path.lineWidth = Constants.lineWidth;
        DesignBook.Colors.secondary.setStroke()
        UIColor.clear.setFill()
        
        path.stroke()
    }
}
