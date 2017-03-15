//
//  AgeScaleView.swift
//  AgeScale
//
//  Created by admin5 on 02.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit
import AudioToolbox

class MeterView: UIView {
    private let scaleView: ScaleView
    private let valueLabel: UILabel
        
    init(frame: CGRect, numberOfItems:Int) {
        scaleView = ScaleView(frame: .zero, numberOfItems: numberOfItems)
        valueLabel = UILabel(frame: .zero)
        
        super.init(frame: frame)
        
        clipsToBounds = true

        valueLabel.textColor = DesignBook.Colors.selected
        valueLabel.font = DesignBook.Fonts.thirtySizeSystemFontRegular
        addSubview(valueLabel)

        addSubview(scaleView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var toggle = true
    
    override func layoutSubviews() {
        if (!toggle) {
            return
        }
        let layout = Layout(bounds: self.bounds)
        scaleView.frame = layout.scaleViewFrame()
        valueLabel.frame = layout.valueLabelFrame()
        toggle = false
    }
    
    //MARK : UIResponder
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        scaleView.rotateToNextItem()
        AudioServicesPlaySystemSound(1306)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = touches.first!.location(in: self)
        let previousTouchPoint = touches.first!.previousLocation(in: self)
        let angle = atan2(touchPoint.y - scaleView.center.y, touchPoint.x - scaleView.center.x)  - atan2(previousTouchPoint.y - scaleView.center.y, previousTouchPoint.x - scaleView.center.x)
        scaleView.transform = scaleView.transform.rotated(by: angle)
    }
    
    //MARK : Public
    
    func setupValue(_ value: Int) {
        valueLabel.text = String(describing: value)
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func scaleViewFrame() -> CGRect {
        return CGRect(x: self.bounds.width / 2,
                      y: 0,
                      width: self.bounds.height,
                      height: self.bounds.height)
    }

    func valueLabelFrame() -> CGRect {
       return CGRect(x: self.bounds.width / 5,
                     y: self.bounds.height / 2 - 20,
                     width: 40,
                     height: 40)
    }
}


