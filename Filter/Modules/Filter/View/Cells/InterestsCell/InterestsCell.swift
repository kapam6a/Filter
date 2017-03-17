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

struct InterestsCellModel: FilterCellModel {
    var cellIdentifier: String {
        return Constants.cellIdentifier
    }
    var cellClass: AnyClass {
        return InterestsCell.self
    }
    let interests: [String]
}

class InterestsCell: UITableViewCell, FilterCell, UISearchBarDelegate {
    private let interestsView: UICollectionView
    private let dataDisplayManager: InterestsDataDisplayManager
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 5
        interestsView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        dataDisplayManager = InterestsDataDisplayManager()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        interestsView.backgroundColor = .clear
        dataDisplayManager.register(in: interestsView)

        contentView.addSubview(interestsView)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        interestsView.frame = .zero
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let layout = Layout(bounds: contentView.bounds)
        interestsView.frame = layout.interestsViewFrame()
//        interestsView.frame.size = interestsView.collectionViewLayout.collectionViewContentSize
//        frame.size.height = interestsView.frame.size.height
    }
    
    //MARK : FilterCell
    
    func configure(withCellModel cellModel: FilterCellModel) {
        let model = cellModel as! InterestsCellModel
        
        dataDisplayManager.setup(withCellModels: model.interests)
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
