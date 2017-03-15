//
//  ViewController.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol FilterViewInput {
    func update(withSectionModels sectionModels: [FilterSectionModel]) 
}

protocol FilterViewOutput:class {
    func viewDidLoad()
    func viewDidTapMaleButton()
    func viewDidTapFemaleButton()
    func viewDidTapMinAgeButton(_ minAge: String)
    func viewDidTapMaxAgeButton(_ maxAge: String)
    func viewDidTapSearchBar()
}

class FilterViewController: ViewController, FilterViewInput {
    weak var output:FilterViewOutput!
    
    private let tableView: UITableView!
    private let dataDisplayManager: FilterDataDisplayManager

    init() {
        tableView = UITableView(frame: .zero, style: .grouped)
 
        dataDisplayManager = FilterDataDisplayManager()

        super.init(nibName: nil, bundle: nil)
        
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .zero
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
        tableView.contentInset = layout.tableViewContentInset()
        tableView.sizeToFit()
        adjustContainerSize(withSize: tableView.frame.size)
    }
    
    //MARK : FilterViewInput
    
    func update(withSectionModels sectionModels: [FilterSectionModel]) {
        dataDisplayManager.setup(withSectionModels: sectionModels)
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func tableViewFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width,
                      height: bounds.height)
    }
    
    func tableViewContentInset() -> UIEdgeInsets {
        return UIEdgeInsets(top: 0,
                            left: 0,
                            bottom: 0,
                            right: 0)
    }
}

