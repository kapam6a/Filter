//
//  File.swift
//  Filter
//
//  Created by admin5 on 20.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class WheelCollectionView: UICollectionView {
    var numberOtItems: Int
    var action: ((Int) -> Void)!
    
    init(frame: CGRect) {
        numberOtItems = 100
        
        super.init(frame: frame, collectionViewLayout: WheelLayout())
            
        showsVerticalScrollIndicator = false
        bounces = false
        self.delegate = self
        self.dataSource = self
        
        register(WheelCollectionViewCell.self, forCellWithReuseIdentifier: "WheelCollectionViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WheelCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    //MARK : UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOtItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WheelCollectionViewCell", for: indexPath) as! WheelCollectionViewCell
        cell.value = indexPath.row
        return cell
    }
    
    //MARK : UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        action(indexPath.row)
    }
}



