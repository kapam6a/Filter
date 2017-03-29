//
//  File.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let cellIdentifier = "InterestsCell"
}

struct InterestsCellModel: BasicTableViewCellModel {
    var cellIdentifier: String {
        return Constants.cellIdentifier
    }
    var cellClass: AnyClass {
        return InterestsCell.self
    }
    let interests: [String]
}

class InterestsCell: UITableViewCell, BasicTableViewCell, UISearchBarDelegate {
    private let interestsCollectionView: InterestsCollectionView
    private let dataDisplayManager: InterestsDataDisplayManager
    private let collectionViewFlowLayout: UICollectionViewFlowLayout
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        collectionViewFlowLayout = UICollectionViewFlowLayout()

        interestsCollectionView = InterestsCollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        
        dataDisplayManager = InterestsDataDisplayManager()

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        interestsCollectionView.backgroundColor = .clear
        interestsCollectionView.bounces = false
        dataDisplayManager.register(in: interestsCollectionView)
        collectionViewFlowLayout.minimumInteritemSpacing = 5
        
        contentView.addSubview(interestsCollectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let layout = Layout(bounds: contentView.bounds)
        interestsCollectionView.frame = layout.interestsViewFrame()
        interestsCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    //MARK : BasicTableViewCell
    
    func configure(withCellModel cellModel: BasicTableViewCellModel) {
        let model = cellModel as! InterestsCellModel
        
        dataDisplayManager.setup(withCellModels: model.interests)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        interestsCollectionView.frame.size = size
        return interestsCollectionView.sizeThatFits(size)
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func interestsViewFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width,
                      height: bounds.height)
    }
}
