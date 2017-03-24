//
//  File.swift
//  Filter
//
//  Created by admin5 on 21.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol WheelCellModel {
    var cellIdentifier: String { get }
    var cellClass: AnyClass { get }
}

protocol WheelCell {
    func configure(withCellModel cellModel: WheelCellModel)
}

class WheelDataDisplayManager: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    private var cellModels: [WheelCellModel]!
    private weak var collectionView: UICollectionView!
    
    func register(in collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func setup(withCellModels cellModels: [WheelCellModel]) {
        self.cellModels = cellModels
        cellModels.forEach { model in
            collectionView.register(model.cellClass, forCellWithReuseIdentifier: model.cellIdentifier)
        }
    }
    
    //MARK : UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = cellModels[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.cellIdentifier, for: indexPath) as! WheelCollectionViewCell
        cell.configure(withCellModel: model)
        return cell
    }
    
    //MARK : UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
