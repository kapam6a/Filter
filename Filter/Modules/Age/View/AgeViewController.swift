//
//  AgeSelectionViewController.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol AgeViewInput: class {
    func update(withValue initialValue: Int)
}

protocol AgeViewOutput: class {
    func viewDidLoad()
    func viewDidSelect(age: Int)
    func viewWillDisappear()
}

class AgeViewController:ViewController, AgeViewInput, WheelViewDelegate {
    weak var output: AgeViewOutput!
    
    private let wheelView: WheelView
        
    init() {
        wheelView = WheelView(frame: .zero, numberOfItems: 100)

        super.init(nibName: nil, bundle: nil)
        
        wheelView.backgroundColor = .clear
        wheelView.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        container.addSubview(wheelView)
        
        output.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = Layout(bounds: container.bounds)
        wheelView.frame = layout.wheelCollectionViewFrame()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        output.viewWillDisappear()
    }
    
    //MARK : AgeViewInput
    
    func update(withValue initialValue: Int) {
        wheelView.setup(initialValue: initialValue)
    }
    
    //MARK : WheelViewDelegate
    
    func wheelView(_ wheelView: WheelView, didChangeValue value: Int) {
        output.viewDidSelect(age: value)
    }
}

fileprivate struct Layout {
    let bounds: CGRect
        
    func wheelCollectionViewFrame() -> CGRect {
        return bounds
    }
}

