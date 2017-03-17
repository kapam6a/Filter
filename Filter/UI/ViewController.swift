//
//  ViewController.swift
//  Filter
//
//  Created by admin5 on 15.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let container: UIView
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        container = UIView(frame: .zero)
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
        container.backgroundColor = DesignBook.Colors.avtBlueBlue
        container.layer.cornerRadius = 4
        container.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.backgroundColor = DesignBook.Colors.avtTwilightBlue
        view = scrollView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(container)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = Layout(bounds: view.bounds)
        container.frame = layout.containerFrame()
    }
    
    func adjustContainerSize(withSize size:CGSize) {
        container.frame.size.height = size.height
        let scrollView = view as! UIScrollView
        scrollView.contentSize.height = size.height + 30
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func scollViewFrame() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: bounds.width ,
                      height: bounds.height)
    }
    
    func containerFrame() -> CGRect {
        return CGRect(x: 15,
                      y: 15,
                      width: bounds.width - 15 * 2,
                      height: bounds.height - 15 - 84)
    }
}
