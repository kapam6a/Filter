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
    private let scrollView: UIScrollView
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        container = UIView(frame: .zero)
        scrollView = UIScrollView(frame: .zero)
        scrollView.backgroundColor = .yellow
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
        container.backgroundColor = DesignBook.Colors.background
        container.layer.cornerRadius = 4
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        scrollView.addSubview(container)
        view.addSubview(scrollView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = Layout(bounds: view.bounds)
        container.frame = layout.containerFrame()
        scrollView.frame = layout.scollViewFrame()
    }
    
    func adjustContainerSize(withSize size:CGSize) {
        if size.height < container.frame.size.height {
            return
        }
        container.frame.size.height = size.height
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
