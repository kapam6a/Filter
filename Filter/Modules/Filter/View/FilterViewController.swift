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
    func viewDidTapMinAgeButton(_ minAge: Int)
    func viewDidTapMaxAgeButton(_ maxAge: Int)
    func viewDidTapSearchBar()
    func viewDidTapMapButton()
    func viewDidTapFilterButton()
    func viewDidTapDoneButton()
}

class FilterViewController: ViewController, FilterViewInput {
    weak var output:FilterViewOutput!
    
    private let tableView: UITableView
    private let dataDisplayManager: FilterDataDisplayManager
    
    private let doneButton: UIButton

    init() {
        tableView = UITableView(frame: .zero, style: .grouped)
        dataDisplayManager = FilterDataDisplayManager()

        doneButton = UIButton(type: .custom)

        super.init(nibName: nil, bundle: nil)
    
        tableView.backgroundColor = .clear
        tableView.bounces = false
        
        dataDisplayManager.register(in: tableView)
        
        doneButton.backgroundColor = DesignBook.Colors.avtBlurple
        doneButton.setTitle("Готово", for: .normal)
        doneButton.setTitleColor(DesignBook.Colors.avtWhite, for: .normal)
        doneButton.titleLabel!.font = DesignBook.Fonts.avtTextStyle4
        doneButton.addTarget(self,
                             action: #selector(didTapDoneButton),
                             for: .touchUpInside)
        
        navigationItem.title = "поиск"
        
        let mapBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "navigation_item_search_icon"),
                                               style: .plain,
                                               target: self,
                                               action: #selector(didTapMapBarButtonItem))
        
        let filterBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "filter_icon"),
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(didTapFilterBarButtonItem))
        
        navigationItem.setRightBarButtonItems([filterBarButtonItem, mapBarButtonItem], animated: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK : Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        container.addSubview(tableView)
        container.addSubview(doneButton)
        
        output.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = Layout(bounds: container.bounds)
        tableView.frame = layout.tableViewFrame()
        doneButton.frame = layout.doneButtonFrame()
    }
    
    //MARK : FilterViewInput
    
    func update(withSectionModels sectionModels: [FilterSectionModel]) {
        dataDisplayManager.setup(withSectionModels: sectionModels)
        tableView.reloadData()
    }
    
    //MARK : Actions
    
    func didTapMapBarButtonItem(_ sender: UIBarButtonItem) {
        output.viewDidTapMapButton()
    }
    
    func didTapFilterBarButtonItem(_ sender: UIBarButtonItem) {
        output.viewDidTapFilterButton()
    }
    
    func didTapDoneButton(_ sender: UIButton) {
        output.viewDidTapDoneButton()
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    private let inset = DesignBook.Insets.tableViewCellInset
    
    func tableViewFrame() -> CGRect {
        return CGRect(x: inset.left,
                      y: 0,
                      width: bounds.width - inset.left - inset.right,
                      height: bounds.height)
    }
    
    func doneButtonFrame() -> CGRect {
        return CGRect(x: 0,
                      y: bounds.height - 49,
                      width: bounds.width,
                      height: 49)
    }

}

