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
    private let interestsView: UICollectionView
    private let dataDisplayManager: InterestsDataDisplayManager
    private let collectionViewFlowLayout: UICollectionViewFlowLayout
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        collectionViewFlowLayout = UICollectionViewFlowLayout()

        interestsView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        
        dataDisplayManager = InterestsDataDisplayManager()
        collectionViewFlowLayout.minimumInteritemSpacing = 5

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
    }
    
    //MARK : BasicTableViewCell
    
    func configure(withCellModel cellModel: BasicTableViewCellModel) {
        let model = cellModel as! InterestsCellModel
        
        dataDisplayManager.setup(withCellModels: model.interests)
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 50.0, height: 155.0)
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
