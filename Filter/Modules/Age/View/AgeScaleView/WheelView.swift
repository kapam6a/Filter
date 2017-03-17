//
//  File.swift
//  Filter
//
//  Created by admin5 on 10.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let itemWidth: CGFloat       = 20
    static let itemHeight: CGFloat      = 10
    static let circleLineWidth: CGFloat = 2
}

protocol WheelViewDelegate {
    func wheelView(_ scaleView: WheelView, didRotateToItemAtIndex index: Int)
}

class WheelView: UIView {
    private var items: [UIButton]
    private let circle: UIView
    
    private var startPoint: CGPoint!
    
    private let numberOfItems: Int
    
    init(frame: CGRect, numberOfItems: Int) {
        items = []
        circle = UIView(frame: .zero)
        self.numberOfItems = numberOfItems
        
        super.init(frame: frame)
        
        circle.backgroundColor = .clear
        circle.layer.borderWidth = Constants.circleLineWidth
        circle.layer.borderColor = DesignBook.Colors.avtBluish.cgColor
        
        addSubview(circle)
        
        for index in 0..<numberOfItems {
            let button = UIButton(frame:.zero)
            button.backgroundColor = .clear
            button.setTitle(String(index), for: .normal)
            button.setTitleColor(DesignBook.Colors.avtDarkSkyBlue, for: .normal)
            button.titleLabel!.font = DesignBook.Fonts.avtTextStyle3
            
            addSubview(button)
            items.append(button)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let layout = Layout(bounds: bounds,
                            radianForSection: radianForSection())
        circle.frame = layout.circleFrame()
        circle.layer.cornerRadius = circle.frame.width / 2
        
        for index in 0..<items.count {
            let button = items[index]
            button.frame = layout.buttonFrame(forIndex: index)
            button.transform = layout.buttonTransform(forIndex: index)
        }
        startPoint = items.first!.convert(items.first!.center, to: superview!)
    }
    
    //MARK : Public
    
    func rotate(fromPoint startPoint: CGPoint, toPoint endPoint: CGPoint) {
        let angle = atan2(endPoint.y - center.y, endPoint.x - center.x)  - atan2(startPoint.y - center.y, startPoint.x - center.x)
        transform = transform.rotated(by: angle)
    }
    
    func rotateToItem(atIndex index: Int) {
        let item = items[index]
        let itemX = item.convert(item.center, to: superview!).x
        let itemY = item.convert(item.center, to: superview!).y
        let angle = atan2(itemY - center.y, itemX - center.x) - atan2(startPoint.y - center.y, startPoint.x - center.x)
        UIView.animate(withDuration: 0.2) {
            self.transform = self.transform.rotated(by: -angle)
        }
    }
    
    //MARK : Private
    
    private func radianForSection() -> CGFloat {
        return CGFloat(2 * M_PI / Double(numberOfItems))
    }
}


fileprivate struct Layout {
    let bounds: CGRect
    let radianForSection: CGFloat
    
    func circleFrame() -> CGRect {
        return CGRect(x:Constants.itemWidth ,
                      y:Constants.itemWidth ,
                      width: bounds.height - Constants.itemWidth * 2 ,
                      height: bounds.height - Constants.itemWidth * 2 )
    }
    
    func buttonFrame(forIndex index: Int) -> CGRect {
        let angle = radianForSection * CGFloat(index) + CGFloat(M_PI)
        let x = (bounds.width / 2 - Constants.itemWidth / 2) * cos(angle) + bounds.width / 2 - Constants.itemWidth / 2
        let y = (bounds.height / 2 - Constants.itemWidth / 2) * sin(angle) + bounds.height / 2 - Constants.itemHeight / 2
        
        return CGRect(x: x,
                      y: y,
                      width: Constants.itemWidth,
                      height: Constants.itemHeight)
    }
    
    func buttonTransform(forIndex index: Int) -> CGAffineTransform {
        return CGAffineTransform(rotationAngle: radianForSection * CGFloat(index))
    }
}


