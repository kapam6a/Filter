//
//  File.swift
//  Filter
//
//  Created by admin5 on 21.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let itemWidth: CGFloat  = 20
    static let itemHeight: CGFloat = 10
}

protocol WheelLayoutDelegate: class {
    func wheelLayout(_ wheelLayout: WheelLayout, didPrepareInitialLayoutForItem atIndex: Int)
}

class WheelLayout: UICollectionViewFlowLayout {
    weak var delegate: WheelLayoutDelegate?
    
    private var selectedItemIndex: Int
    
    private var anglePerItem: CGFloat {
        return 1.5 * CGFloat(M_PI) / CGFloat(collectionView!.numberOfItems(inSection: 0))
    }
    
    private var angleAtExtreme: CGFloat {
        return -CGFloat(collectionView!.numberOfItems(inSection: 0) - 1) * anglePerItem
    }
    private var angle: CGFloat {
        return angleAtExtreme * collectionView!.contentOffset.y / (collectionViewContentSize.height - collectionView!.bounds.height)
    }
    
    private var attributesList: [WheelCollectionViewLayoutAttributes]
    private var radius: CGFloat
    
    override init() {
        attributesList = []
        radius = 200
        selectedItemIndex = 0
        
        super.init()
        
        itemSize = CGSize(width: Constants.itemWidth,
                          height: Constants.itemHeight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        
        let centerY = collectionView!.contentOffset.y + (collectionView!.bounds.height / 2)
        attributesList = (0..<collectionView!.numberOfItems(inSection: 0)).map { (i) -> WheelCollectionViewLayoutAttributes in
            let attributes = WheelCollectionViewLayoutAttributes(forCellWith: IndexPath(item: i,
                                                                                        section: 0))
            attributes.size = itemSize
            attributes.center = CGPoint(x: collectionView!.bounds.midX, y: centerY)
            attributes.angle = angle + (anglePerItem * CGFloat(i))
            if -0.02...0.02 ~= attributes.angle && selectedItemIndex != i{
                selectedItemIndex = i
                delegate?.wheelLayout(self, didPrepareInitialLayoutForItem: selectedItemIndex)
            }

            let anchorPointX = ((itemSize.height / 2) + radius) / itemSize.height
            attributes.anchorPoint = CGPoint(x: anchorPointX , y: 0.5)
            
            return attributes
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributesList
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
            return attributesList[indexPath.row]
    }

    override var collectionViewContentSize: CGSize {
        return CGSize(width: collectionView!.frame.width,
                      height:CGFloat(collectionView!.numberOfItems(inSection: 0)) * itemSize.height)
    }
    
    override class var layoutAttributesClass: Swift.AnyClass {
        return WheelCollectionViewLayoutAttributes.self
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    //MARK : Public 
    
    func changePositionToItem(atIndex: Int) {

    }
}

class WheelCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    var anchorPoint: CGPoint
    var angle: CGFloat
    
    override init() {
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        angle = 0
    }
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let copiedAttributes: WheelCollectionViewLayoutAttributes =
            super.copy(with: zone) as! WheelCollectionViewLayoutAttributes
        copiedAttributes.anchorPoint = anchorPoint
        copiedAttributes.angle = angle
        return copiedAttributes
    }
}


