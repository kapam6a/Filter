//
//  File.swift
//  Filter
//
//  Created by admin5 on 20.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class WheelCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        
        super.init(frame: frame, collectionViewLayout: layout)
            
        showsVerticalScrollIndicator = false
        bounces = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



