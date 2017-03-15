//
//  AgeSelectionViewController.swift
//  Filter
//
//  Created by admin5 on 07.03.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import UIKit

protocol AgeViewInput {
    func update(withValue initialValue: Int)
}

protocol AgeViewOutput: class {
    func viewDidLoad()
}

class AgeViewController:ViewController, AgeViewInput {
    var output: AgeViewOutput!
    
    private let meterView: MeterView
    
    init() {
        meterView = MeterView(frame: .zero, numberOfItems: 100)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        container.addSubview(meterView)
        
        output.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = Layout(bounds: container.bounds)
        meterView.frame = layout.ageScaleViewFrame()
    }
    
    //MARK : AgeViewInput
    
    func update(withValue initialValue: Int) {
        meterView.setupValue(initialValue)
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func ageScaleViewFrame() -> CGRect {
        return bounds
    }
}

