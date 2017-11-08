//
//  ReusableView.swift
//  w6d3-demo-2
//
//  Created by Roland on 2017-11-07.
//  Copyright © 2017 Roland. All rights reserved.
//

import UIKit

@IBDesignable
class ReusableView: UIView {

    // MARK: - Public properties
    
    @IBInspectable
    var color: UIColor = UIColor.green {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable
    var labelText: String = "Hello" {
        didSet {
            setupView()
        }
    }

    // MARK: - IBOutlets
    @IBOutlet weak var label: UILabel!

    // MARK: - Private properties
    private var contentView: UIView!

    // MARK: - Initializers
    
    override init(frame: CGRect) {
        // Called when view is created from code
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // Called when view is created from XIB
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func prepareForInterfaceBuilder() {
        // Called when view is live rendered on Storyboard
        super.prepareForInterfaceBuilder()
        commonInit()
    }

    fileprivate func setupView() {
        label.text = labelText
        contentView.backgroundColor = color
    }

    private func commonInit() {
        setupFromXib()
        setupView()
    }

    private func setupFromXib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ReusableView", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {
            assertionFailure("Unable to load XIB file for ReusableView")
            return
        }
        
        contentView = view
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
