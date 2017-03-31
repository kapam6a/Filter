//
//  AgeSelectionViewController.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol ShortProfileViewInput {
    func goIntoLoadingState()
    func goIntoNormalState()
    func update(withCellModels cellModels: [BasicTableViewCellModel])
    func goIntoErrorState(with error: Error)
}

protocol ShortProfileViewOutput: class {
    func viewDidLoad()
    func viewDidTapChatButton()
    func viewDidTapFavoriteButton()
    func viewDidTapRouteButton()
    func viewDidTapOnMapButton()
    func viewDidTapFacebookButton()
    func viewDidTapInstagramButton()
    func viewDidTapThreeDotsButton()
}

class ShortProfileViewController:UIViewController, ShortProfileViewInput {
    weak var output: ShortProfileViewOutput!
    
    private let tableView: UITableView
    private let dataDisplayManager: ShortProfileDisplayManager
    
    private let activityIndicator: UIActivityIndicatorView
    
    init() {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        dataDisplayManager = ShortProfileDisplayManager()
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        
        super.init(nibName: nil, bundle: nil)
        
        tableView.bounces = false
        tableView.backgroundColor = .clear
        dataDisplayManager.register(in: tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK : Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DesignBook.Colors.avtBlueBlue
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        view.addSubview(activityIndicator)
        view.addSubview(tableView)
                
        output.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = Layout(bounds: view.bounds)
        tableView.frame = layout.tableViewFrame()
        activityIndicator.center = layout.activityIndicatorCenter()
    }
    
    //MARK : ShortProfileViewInput
    
    func update(withCellModels cellModels: [BasicTableViewCellModel]) {
        dataDisplayManager.setup(withCellModels: cellModels)
    }
    
    func goIntoLoadingState() {
        activityIndicator.startAnimating()
    }
    
    func goIntoNormalState() {
        activityIndicator.stopAnimating()
    }
    
    func goIntoErrorState(with error: Error) {
        let alert = UIAlertController(title: "Error",
                                      message: error.localizedDescription,
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: UIAlertActionStyle.default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    private let inset = DesignBook.Insets.tableViewInset
    
    func tableViewFrame() -> CGRect {
        return CGRect(x: inset.left,
                      y: 64,
                      width: bounds.width - inset.left - inset.right,
                      height: bounds.height)
    }
    
    func activityIndicatorCenter() -> CGPoint {
        return CGPoint(x: bounds.width / 2,
                       y: bounds.height / 2)
    }

}
