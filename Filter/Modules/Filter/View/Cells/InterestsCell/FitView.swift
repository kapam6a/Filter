//
//  File.swift
//  Filter
//
//  Created by admin5 on 10.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol FitViewDataSource: class {
    func numberOfItems(in fitView: FitView) -> Int
    func fitView(_ fitView: FitView, heightForItemAtIndex index: Int) -> CGFloat
    func fitView(_ fitView: FitView, titleForItemAtIndex index: Int) -> String
    func fitView(_ fitView: FitView, colorForNormalStateItemAtIndex index: Int) -> UIColor
    func fitView(_ fitView: FitView, colorForSelectedItemAtIndex index: Int) -> UIColor
}

class FitView: UIView {
    weak open var dataSource: FitViewDataSource!
    
    private var items: [UIButton]
    
    override init(frame: CGRect) {
        items = []
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var previousItemFrame: CGRect = .zero
        
        for index in 0..<items.count {
            let item = items[index]
            let itemHeight = dataSource!.fitView(self, heightForItemAtIndex: index)
            let layout = Layout(bounds: bounds,
                                itemHeight: itemHeight,
                                item: item,
                                previousItemFrame: previousItemFrame)
            item.frame = layout.itemFrame()
            item.layer.cornerRadius = item.frame.height / 2 
            previousItemFrame = item.frame
        }
        
//        if let lastItem =  items.last {
//            bounds = CGRect(x: 0,
//                            y: 0,
//                            width: bounds.width,
//                            height: lastItem.frame.maxY)
//        }
    }
    
    //MARK : Public
    
    func reloadData() {
        for index in 0..<items.count{
            let item = items[index]
            item.removeFromSuperview()
            items.remove(at: index)
        }
        
        let numberOfItems = dataSource!.numberOfItems(in: self)
        for index in 0..<numberOfItems {
            let item = UIButton(frame: .zero)
            let title = dataSource!.fitView(self, titleForItemAtIndex: index)
            let colorForNormalStateItemAtIndex = dataSource!.fitView(self, colorForNormalStateItemAtIndex: index)
            let colorForSelectedItemAtIndex = dataSource!.fitView(self, colorForSelectedItemAtIndex: index)
            
            item.layer.borderColor = colorForNormalStateItemAtIndex.cgColor
            item.layer.borderWidth = 0.5
            item.setTitleColor(colorForNormalStateItemAtIndex, for: .normal)
            item.setTitleColor(colorForSelectedItemAtIndex, for: .selected)
            item.titleLabel!.font = DesignBook.Fonts.elevenSizeSystemFontMedium
            item.setTitle(title, for: .normal)
            
            item.backgroundColor = .yellow
            
            addSubview(item)
            items.append(item)
        }
        self.layoutIfNeeded()
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    let itemHeight: CGFloat
    let item: UIButton
    let previousItemFrame: CGRect
    let padding: CGFloat = 5
    let inset:CGFloat = 10
    
    func itemFrame() -> CGRect {
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        let font = item.titleLabel!.font!
        let textSize = item.titleLabel!.text!.size(attributes: [NSFontAttributeName: font])
        
        let previousItemMaxX = previousItemFrame.maxX
            
        if previousItemMaxX + textSize.width < bounds.width {
            x = previousItemMaxX + padding
            y = previousItemFrame.minY
        } else {
            x = padding
            y = previousItemFrame.minY + itemHeight + padding
        }
        return CGRect(x: x,
                      y: y,
                      width: textSize.width + inset,
                      height: itemHeight)
    }
}
