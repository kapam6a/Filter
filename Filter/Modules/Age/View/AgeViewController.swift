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
    func viewDidSelect(age: Int)
}

class AgeViewController:ViewController, AgeViewInput {
    weak var output: AgeViewOutput!
    
    private let wheelCollectionView: WheelCollectionView
    
    private let valueLabel: UILabel
    
    init() {
        wheelCollectionView = WheelCollectionView(frame: .zero)
        
        valueLabel = UILabel(frame: .zero)
        
        super.init(nibName: nil, bundle: nil)
        
        wheelCollectionView.backgroundColor = .clear
        wheelCollectionView.action = { value in
            self.output.viewDidSelect(age: value)
        }
        
        valueLabel.textColor = DesignBook.Colors.avtWhite
        valueLabel.font = DesignBook.Fonts.avtTextStyle5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        container.addSubview(wheelCollectionView)
        container.addSubview(valueLabel)
        
        output.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let layout = Layout(bounds: container.bounds)
        wheelCollectionView.frame = layout.wheelCollectionViewFrame()
        valueLabel.frame = layout.valueLabelFrame()
    }
    
    //MARK : AgeViewInput
    
    func update(withValue initialValue: Int) {
        valueLabel.text = String(initialValue)
    }
}

fileprivate struct Layout {
    let bounds: CGRect
    
    func wheelCollectionViewFrame() -> CGRect {
        return bounds
    }
    
    func valueLabelFrame() -> CGRect {
        return CGRect(x: bounds.width / 5,
                      y: bounds.height / 2 - 30 / 2,
                      width: 30,
                      height: 30)
    }
}

