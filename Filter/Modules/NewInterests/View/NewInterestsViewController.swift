//
//  AgeSelectionViewController.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol NewInterestsViewInput {
    func update(withCellModels cellModels: [NewInterestsCellModel])
}

protocol NewInterestsViewOutput: class {
    func viewDidLoad()
    func viewDidTapPlusButton(withTitle title: String)
    func viewDidChange(searchText: String)
    func viewDidTapCloseButton()
}

class NewInterestsViewController:ViewController, NewInterestsViewInput, UISearchBarDelegate {
     var output: NewInterestsViewOutput!
    
    private let tableView: UITableView
    private let dataDisplayManager: NewInterestsDataDisplayManager
    
    init() {
        tableView = UITableView(frame: .zero, style: .grouped)
        dataDisplayManager = NewInterestsDataDisplayManager()
        
        super.init(nibName: nil, bundle: nil)
        
        tableView.backgroundColor = .clear
        tableView.bounces = false
        
        dataDisplayManager.register(in: tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK : Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        container.addSubview(tableView)
        
        output.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = Layout(bounds: container.bounds)
        tableView.frame = layout.tableViewFrame()
        tableView.contentInset = layout.tableViewInset()
        tableView.sizeToFit()
        adjustContainerSize(withSize: tableView.frame.size)
    }
    
    //MARK : NewInterestsViewInput
    
    func update(withCellModels cellModels: [NewInterestsCellModel]) {
        dataDisplayManager.setup(withCellModels: cellModels)
        tableView.reloadData()
    }
}

fileprivate struct Layout {
    let bounds: CGRect
        
    func tableViewFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width ,
                      height: bounds.height)
    }
    
    func tableViewInset() -> UIEdgeInsets {
        return UIEdgeInsets(top: -30,
                            left: 0,
                            bottom: 0,
                            right: 0)
    }
}
