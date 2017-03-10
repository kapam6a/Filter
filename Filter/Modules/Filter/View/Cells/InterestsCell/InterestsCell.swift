//
//  File.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let cellIdentifier    = "InterestsCell"
    static let footerTitle       = "интересы"
    static let footerIdentifier  = "FilterTableViewFooter"
    static let headerTitle       = "выберите хэштег для поиска похожих интересов или использовать панель поиска"
}

struct InterestsCellModel: FilterCellModel {
    var cellIdentifier: String {
        return Constants.cellIdentifier
    }
    var cellClass: AnyClass {
        return InterestsCell.self
    }
    var footerTitle: String {
        return Constants.footerTitle
    }
    var footerClass: AnyClass {
        return FilterTableViewFooter.self
    }
    var footerIdentifier: String {
        return Constants.footerIdentifier
    }
    var headerTitle: String {
        return Constants.headerTitle
    }
    let interests: [String]
}

class InterestsCell: UITableViewCell, FilterCell, FitViewDataSource {
    private let fitView: FitView
    private var interests: [String]
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        fitView = FitView(frame: .zero)
        interests = []
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        fitView.dataSource = self
        addSubview(fitView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let layout = Layout(bounds: bounds)
        fitView.frame = layout.fitViewFrame()
    }
    
    //MARK : FilterCell
    
    func configure(withCellModel cellModel: FilterCellModel) {
        let model = cellModel as! InterestsCellModel
        interests = model.interests
        fitView.reloadData()
    }
    
    //MARK : FitViewDataSource
    
    func numberOfItems(in fitView: FitView) -> Int {
        return interests.count
    }
    func fitView(_ fitView: FitView, heightForItemAtIndex index: Int) -> CGFloat {
        return 29
    }
    
    func fitView(_ fitView: FitView, titleForItemAtIndex index: Int) -> String {
        return interests[index]
    }
    
    func fitView(_ fitView: FitView, colorForNormalStateItemAtIndex index: Int) -> UIColor {
        return DesignBook.Colors.primary
    }
    
    func fitView(_ fitView: FitView, colorForSelectedItemAtIndex index: Int) -> UIColor {
        return DesignBook.Colors.selected
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func fitViewFrame() -> CGRect {
        return bounds
    }
}

