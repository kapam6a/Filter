//
//  InterestsCollectionView.swift
//  Filter
//
//  Created by admin5 on 28.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class InterestsCollectionView: UICollectionView {
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return collectionViewLayout.collectionViewContentSize
    }
}
