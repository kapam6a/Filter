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
    func viewDidTapMapButton()
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
        
        navigationItem.title = "поиск"
        
        let mapBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "navigation_item_search_icon"),
                                               style: .plain,
                                               target: self,
                                               action: #selector(didTapMapBarButtonItem(_ :)))
        navigationItem.setRightBarButton(mapBarButtonItem, animated: false)
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
    }
    
    //MARK : Actions
    
    func didTapMapBarButtonItem(_ sender: UIBarButtonItem) {
        output.viewDidTapMapButton()
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
        return .zero
    }
    
    func doneButtonFrame() -> CGRect {
        return CGRect(x: 0,
                      y: bounds.height - 49,
                      width: bounds.width,
                      height: 49)
    }

}

