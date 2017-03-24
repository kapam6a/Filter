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
            
            attributes.center = CGPoint(x: x / 2, y: y / 2 + collectionView!.contentOffset.y)
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
