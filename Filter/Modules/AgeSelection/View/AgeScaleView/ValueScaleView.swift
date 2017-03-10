//
//  AgeScaleView.swift
//  AgeScale
//
//  Created by admin5 on 02.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class ValueScaleView: UIView {
    var value: Int {
        didSet {
            valueLabel.text = String(describing: value)
        }
    }
    
    private let rotatedView: RotatedView
    private let valueLabel: UILabel
    
    override init(frame: CGRect) {
        rotatedView = RotatedView(frame: .zero)
        valueLabel = UILabel(frame: .zero)
        value = 0
        
        super.init(frame: frame)
        
        valueLabel.textColor = DesignBook.Colors.selected
        valueLabel.font = DesignBook.Fonts.thirtySizeSystemFontRegular
        
        addSubview(rotatedView)
        addSubview(valueLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let layout = Layout(bounds: self.bounds)
        rotatedView.frame = layout.rotatedViewFrame()
        valueLabel.frame = layout.valueLabelFrame()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = touches.first!.location(in: self)
        let previousTouchPoint = touches.first!.previousLocation(in: self)
        let angle = atan2(touchPoint.y - center.y, touchPoint.x - center.x)  - atan2(previousTouchPoint.y - center.y, previousTouchPoint.x - center.x)
        rotatedView.transform = rotatedView.transform.rotated(by: angle)
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func rotatedViewFrame() -> CGRect {
        return CGRect(x: self.bounds.width / 2,
                      y: 0,
                      width: self.bounds.width * 2,
                      height: self.bounds.height)
    }
    
    func valueLabelFrame() -> CGRect {
       return CGRect(x: self.bounds.width / 5,
                     y: self.bounds.height / 2 - 20,
                     width: 40,
                     height: 40)
    }
}


