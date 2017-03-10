//
//  ViewController.swift
//  Filter
//
//  Created by admin5 on 06.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol FilterViewInput {
    func update(withCellModels cellModels: [FilterCellModel])
}

protocol FilterViewOutput:class {
    func viewDidLoad()
    func viewDidTapMaleButton()
    func viewDidTapFemaleButton()
    func viewDidTapMinAgeButton(_ minAge: String)
    func viewDidTapMaxAgeButton(_ maxAge: String)
}

class FilterViewController: UIViewController, FilterViewInput {
    weak var output:FilterViewOutput!
    
    private let tableView: UITableView!
    private let dataDisplayManager: FilterDataDisplayManager

    init() {
        tableView = UITableView(frame: .zero, style: .grouped)
 
        dataDisplayManager = FilterDataDisplayManager()

        super.init(nibName: nil, bundle: nil)
        
        tableView.backgroundColor = DesignBook.Colors.background
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 4
        tableView.bounces = false
        
        dataDisplayManager.register(in: tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK : Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .white

        output.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = Layout(bounds: view.bounds)
        tableView.frame = layout.tableViewFrame()
    }
    
    //MARK : FilterViewInput
    
    func update(withCellModels cellModels: [FilterCellModel]) {
        dataDisplayManager.setup(withCellModels: cellModels)
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func tableViewFrame() -> CGRect {
        return CGRect(x: 15,
                      y: 20,
                      width: bounds.width - 15 * 2,
                      height: bounds.height - 20 * 2)
    }
}

