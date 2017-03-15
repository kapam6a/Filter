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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestsCollectionViewCell", for: indexPath) as! InterestsCollectionViewCell
        cell.titleLabel.text = cellModels[indexPath.row]
        cell.layer.cornerRadius = cell.frame.height / 2
        return cell
    }
    
    //MARK : UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let textSize = cellModels[indexPath.row].size(attributes: [NSFontAttributeName: DesignBook.Fonts.elevenSizeSystemFontMedium])
        return CGSize(width: textSize.width + 10, height: textSize.height + 8)
    }
}
