//
//  File.swift
//  Filter
//
//  Created by admin5 on 20.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit
import AudioToolbox

protocol WheelViewDelegate: class {
    func wheelView(_ wheelView: WheelView, didChangeValue value: Int)
}

class WheelView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, WheelLayoutDelegate {
    weak var delegate: WheelViewDelegate?

    private let collectionView: UICollectionView
    private let collectionViewLayout: WheelLayout
    private let circleView: UIView
    private let valueLabel: UILabel
    private var numberOtItems: Int
    
    init(frame: CGRect, numberOfItems: Int) {
        self.numberOtItems = numberOfItems
        
        collectionViewLayout = WheelLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        circleView = UIView(frame: .zero)
        valueLabel = UILabel(frame: .zero)

        super.init(frame: frame)
        
        circleView.layer.borderWidth = 1
        circleView.layer.borderColor = DesignBook.Colors.avtBluish.cgColor
        addSubview(circleView)
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(WheelCollectionViewCell.self, forCellWithReuseIdentifier: "WheelCollectionViewCell")
        addSubview(collectionView)
        
        valueLabel.textColor = DesignBook.Colors.avtWhite
        valueLabel.font = DesignBook.Fonts.avtTextStyle5
        valueLabel.text = String(numberOtItems)
        addSubview(valueLabel)
        
        collectionViewLayout.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = Layout(bounds: bounds)
        collectionView.frame = layout.collectionViewframe()
        valueLabel.frame = layout.valueLabelFrame()
        circleView.frame = layout.circleViewFrame()
        circleView.layer.cornerRadius = circleView.frame.height / 2
    }
    
    //MARK : UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOtItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WheelCollectionViewCell", for: indexPath) as! WheelCollectionViewCell
        cell.value = numberOtItems - indexPath.row
        return cell
    }
    
    //MARK : Public methods
    
    func setup(initialValue: Int) {
        valueLabel.text = String(initialValue)
        collectionViewLayout.changePositionToItem(atIndex: numberOtItems - initialValue)
    }
    
    //MARK : WheelLayoutDelegate 
    
    func wheelLayout(_ wheelLayout: WheelLayout, didPrepareInitialLayoutForItem atIndex: Int) {
        guard let item = collectionView.cellForItem(at: IndexPath(item: atIndex, section: 0)) as? WheelCollectionViewCell else { return }
        valueLabel.text = String(item.value)
        AudioServicesPlaySystemSound(1104)
        delegate?.wheelView(self, didChangeValue: item.value)
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    private let circleRadius: CGFloat = 400
    private let valueLabelSide: CGFloat = 30
    
    func collectionViewframe() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width,
                      height: bounds.height)

    }
    
    func valueLabelFrame() -> CGRect {
        return CGRect(x: bounds.width / 5,
                      y: bounds.height / 2 - valueLabelSide / 2,
                      width: valueLabelSide,
                      height: valueLabelSide)
    }
    
    func circleViewFrame() -> CGRect {
        return CGRect(x: bounds.width / 2,
                      y: bounds.height / 2 - circleRadius ,
                      width: circleRadius * 2,
                      height: circleRadius * 2)
    }
}



