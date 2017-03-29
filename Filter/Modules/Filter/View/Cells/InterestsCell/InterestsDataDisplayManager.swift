//
//  TagsDataDisplayManager.swift
//  Filter
//
//  Created by admin5 on 13.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class InterestsDataDisplayManager:NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private weak var collectionView: UICollectionView!
    private var cellModels: [String]!
    
    func register(in collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        collectionView.register(InterestsCollectionViewCell.self, forCellWithReuseIdentifier: "InterestsCollectionViewCell")
    }
    
    func setup(withCellModels cellModels: [String]) {
        self.cellModels = cellModels
    }

    //MARK : UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let interestsCell = cell as! InterestsCollectionViewCell
        interestsCell.title = cellModels[indexPath.row]
        interestsCell.layer.cornerRadius = interestsCell.frame.height / 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestsCollectionViewCell", for: indexPath)
        return cell
    }
    
    //MARK : UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return InterestsCollectionViewCell.size(title: cellModels[indexPath.row])
    }
}


