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

class WheelCollectionViewLayout: UICollectionViewFlowLayout {
    private var attributesList: [UICollectionViewLayoutAttributes]
    
    override init() {
        attributesList = []
        
        super.init()
        
        minimumLineSpacing = 5
        itemSize = CGSize(width: Constants.itemWidth,
                          height: Constants.itemHeight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: collectionView!.bounds.width,
                      height: CGFloat(collectionView!.numberOfItems(inSection: 0)) * itemSize.height)
    }
    
    override func prepare() {
        super.prepare()
        attributesList = (0..<collectionView!.numberOfItems(inSection: 0)).map { (i)
            -> UICollectionViewLayoutAttributes in
            let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: i,
                                                                                     section: 0))
            
            let radianForSection: CGFloat = CGFloat(2 * M_PI / Double(collectionView!.numberOfItems(inSection: 0)))
            let angle = radianForSection * CGFloat(i) + CGFloat(M_PI)
            let x = (collectionView!.bounds.width * 2) * cos(angle) + collectionView!.bounds.width * 3
            let y = (collectionView!.bounds.width * 2) * sin(angle) + collectionView!.bounds.height
            
            attributes.center = CGPoint(x: x / 2 , y: y / 2 + collectionView!.contentOffset.y)
            attributes.size = itemSize
            attributes.transform = CGAffineTransform(rotationAngle: radianForSection * CGFloat(i))
            
            return attributes
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributesList
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

////////////////////////////////////////////////////////////////////////////////////////

class WheelLayout: UICollectionViewFlowLayout {
    var attributesList: [CircularCollectionViewLayoutAttributes]  = []
    
    var radius: CGFloat = 400
    var anglePerItem: CGFloat {
        return atan(itemSize.width / radius)
    }
    
    var angleAtExtreme: CGFloat {
        return collectionView!.numberOfItems(inSection: 0) > 0 ?
            -CGFloat(collectionView!.numberOfItems(inSection: 0) - 1) * anglePerItem : 0
    }
    var angle: CGFloat {
        return angleAtExtreme * collectionView!.contentOffset.x / (collectionViewContentSize.width - collectionView!.bounds.width)
    }
    
    override init() {
        super.init()
        
        minimumLineSpacing = 5
        itemSize = CGSize(width: Constants.itemWidth,
                          height: Constants.itemHeight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        
        let centerX = collectionView!.contentOffset.x + (collectionView!.bounds.width / 2.0)
        attributesList = (0..<collectionView!.numberOfItems(inSection: 0)).map { (i) -> CircularCollectionViewLayoutAttributes in
            let attributes = CircularCollectionViewLayoutAttributes(forCellWith: IndexPath(item: i,
                                                                                           section: 0))
            attributes.size = itemSize
            attributes.center = CGPoint(x: centerX, y: collectionView!.bounds.midY)
            attributes.angle = angle + (anglePerItem * CGFloat(i))
            
            let anchorPointY = ((itemSize.height / 2.0) + radius) / itemSize.height
            attributes.anchorPoint = CGPoint(x: 0.5, y: anchorPointY)
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
        return CGSize(width: CGFloat(collectionView!.numberOfItems(inSection: 0)) * itemSize.width,
                      height: collectionView!.frame.height)
    }
    
    override class var layoutAttributesClass: Swift.AnyClass {
        return CircularCollectionViewLayoutAttributes.self
    }
}

class CircularCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    var anchorPoint = CGPoint(x: 0.5, y: 0.5)
    var angle: CGFloat = 0 {
        didSet {
            zIndex = Int(angle * 1000000)
            transform = CGAffineTransform(rotationAngle: angle)
        }
    }
    override func copy(with zone: NSZone? = nil) -> Any {
        let copiedAttributes: CircularCollectionViewLayoutAttributes =
            super.copy(with: zone) as! CircularCollectionViewLayoutAttributes
        copiedAttributes.anchorPoint = anchorPoint
        copiedAttributes.angle = angle
        return copiedAttributes
    }
}


