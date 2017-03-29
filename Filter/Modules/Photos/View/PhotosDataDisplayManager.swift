//
//  File.swift
//  Filter
//
//  Created by admin5 on 13.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class PhotosDataDisplayManager: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private var cellModels: [BasicCollectionViewCellModel]!
    private weak var collectionView: UICollectionView!
    
    func register(in collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func setup(withCellModels cellModels: [BasicCollectionViewCellModel]) {
        self.cellModels = cellModels
        self.cellModels.forEach({ cellModel in
            collectionView.register(cellModel.cellClass, forCellWithReuseIdentifier: cellModel.cellIdentifier)
        })
    }
    
    //MARK : UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = cellModels[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.cellIdentifier, for: indexPath) as! BasicCollectionViewCell
        cell.configure(withCellModel: model)
        return cell as! UICollectionViewCell
    }
}
