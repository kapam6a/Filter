//
//  File.swift
//  Filter
//
//  Created by admin5 on 13.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol PhotosCellModel {
    var cellIdentifier: String { get }
    var cellClass: AnyClass { get }
}

protocol PhotosCell {
    func configure(withCellModel cellModel: PhotosCellModel)
    static func size(withModel model: PhotosCellModel) -> CGSize
}

class PhotosDataDisplayManager: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private var cellModels: [PhotosCellModel]!
    private weak var collectionView: UICollectionView!
    
    func register(in collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func setup(withCellModels cellModels: [PhotosCellModel]) {
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.cellIdentifier, for: indexPath) as! PhotosCell
        cell.configure(withCellModel: model)
        return cell as! UICollectionViewCell
    }
    
    //MARK : UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let model = cellModels[indexPath.row]
        let photoClass: PhotosCell.Type = model.cellClass as! PhotosCell.Type
        var photoSize = photoClass.size(withModel: model)
        
        if photoSize.width > collectionView.frame.width {
            photoSize.height = photoSize.height * collectionView.frame.width / photoSize.width
            photoSize.width = collectionView.frame.width
        }
        return photoSize
    }
}
