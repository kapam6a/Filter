//
//  File.swift
//  Filter
//
//  Created by admin5 on 22.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class PhotosCollectionViewFlowLayout: UICollectionViewFlowLayout {
    var attributes: [UICollectionViewLayoutAttributes]
    
    override init() {
        attributes = []
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        
        let layout = Layout(bounds: collectionView!.frame)
        
        let zeroPhotoAttributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: 0, section: 0))
        zeroPhotoAttributes.frame = layout.zeroPhotoFrame()
        attributes.append(zeroPhotoAttributes)
        
        let firstPhotoAttributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: 1, section: 0))
        firstPhotoAttributes.frame = layout.firstPhotoFrame()
        attributes.append(firstPhotoAttributes)
        
        let secondPhotoAttributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: 2, section: 0))
        secondPhotoAttributes.frame = layout.secondPhotoFrame()
        attributes.append(secondPhotoAttributes)
        
        let thirdPhotoAttributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: 3, section: 0))
        thirdPhotoAttributes.frame = layout.thirdPhotoFrame()
        attributes.append(thirdPhotoAttributes)
        
        let fourthPhotoAttributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: 4, section: 0))
        fourthPhotoAttributes.frame = layout.fourthPhotoFrame()
        attributes.append(fourthPhotoAttributes)
        
        let fifthPhotoAttributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: 5, section: 0))
        fifthPhotoAttributes.frame = layout.fifthPhotoFrame()
        attributes.append(fifthPhotoAttributes)
        
        let sixthPhotoAttributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: 6, section: 0))
        sixthPhotoAttributes.frame = layout.sixthPhotoFrame()
        attributes.append(sixthPhotoAttributes)
        
        let seventhPhotoAttributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: 7, section: 0))
        seventhPhotoAttributes.frame = layout.seventhPhotoFrame()
        attributes.append(seventhPhotoAttributes)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributes
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func zeroPhotoFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width * 188 / 325,
                      height: bounds.height * 211 / 562)
    }
    
    func firstPhotoFrame() -> CGRect {
        return CGRect(x: bounds.width *  193 / 325,
                      y: 0,
                      width: bounds.width * 82 / 325,
                      height: bounds.height * 82 / 562)
    }
    
    func secondPhotoFrame() -> CGRect {
        return CGRect(x: bounds.width *  193 / 325,
                      y: bounds.height * 87 / 562,
                      width: bounds.width * 121 / 325,
                      height: bounds.height * 124 / 562)
    }
    
    func thirdPhotoFrame() -> CGRect {
        return CGRect(x: 0,
                      y: bounds.height * 216 / 562,
                      width: bounds.width * 145 / 325,
                      height: bounds.height * 130 / 562)
    }
    
    func fourthPhotoFrame() -> CGRect {
        return CGRect(x: bounds.width *  150 / 325,
                      y: bounds.height * 216 / 562,
                      width: bounds.width * 134 / 325,
                      height: bounds.height * 130 / 562)
    }
    
    func fifthPhotoFrame() -> CGRect {
        return CGRect(x: 0,
                      y: bounds.height * 351 / 562,
                      width: bounds.width * 82 / 325,
                      height: bounds.height * 82 / 562)
    }
    
    func sixthPhotoFrame() -> CGRect {
        return CGRect(x: 0,
                      y: bounds.height * 438 / 562,
                      width: bounds.width * 82 / 325,
                      height: bounds.height * 124 / 562)
    }
    
    func seventhPhotoFrame() -> CGRect {
        return CGRect(x: bounds.width *  87 / 325,
                      y: bounds.height * 351 / 562,
                      width: bounds.width * 227 / 325,
                      height: bounds.height * 211 / 562)
    }
}
