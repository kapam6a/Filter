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
    private let wheelView: WheelView
    private let valueLabel: UILabel
    
    private var currentIndex: Int
    private var numberOfItems: Int
    
    init(frame: CGRect, numberOfItems:Int) {
        wheelView = WheelView(frame: .zero, numberOfItems: numberOfItems)
        valueLabel = UILabel(frame: .zero)
        
        currentIndex = 0
        self.numberOfItems = numberOfItems
        
        super.init(frame: frame)
        
        clipsToBounds = true

        valueLabel.textColor = DesignBook.Colors.avtWhite
        valueLabel.font = DesignBook.Fonts.avtTextStyle5
        addSubview(valueLabel)

        addSubview(wheelView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let layout = Layout(bounds: bounds)
        wheelView.frame = layout.wheelViewFrame()
        valueLabel.frame = layout.valueLabelFrame()
    }
    
    //MARK : UIResponder
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let nextIndex = (currentIndex + 1) % numberOfItems
//        wheelView.rotateToItem(atIndex: nextIndex)
//        currentIndex = nextIndex
//    }
//    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        AudioServicesPlaySystemSound(1306)
//        let touchPoint = touches.first!.location(in: self)
//        let previousTouchPoint = touches.first!.previousLocation(in: self)
//        wheelView.rotate(fromPoint: previousTouchPoint, toPoint: touchPoint)
//    }
    
    //MARK : Public
    
    func setupValue(_ value: Int) {
        valueLabel.text = String(describing: value)
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func wheelViewFrame() -> CGRect {
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


