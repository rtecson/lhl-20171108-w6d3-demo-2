//
//  ViewController.swift
//  w6d3-demo-2
//
//  Created by Roland on 2017-11-07.
//  Copyright © 2017 Roland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var view1: ReusableView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: ReusableView!
    @IBOutlet weak var view4: UIView!
}

// MARK: - UIViewController methods
extension ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }
}

// MARK: - Private methods
extension ViewController {
    
    private func setup() {
        let reusableView1 = ReusableView()
        add(reusableView: reusableView1, to: view2)
        reusableView1.color = UIColor.orange
        reusableView1.labelText = "Orange"
        
        let reusableView2 = ReusableView()
        add(reusableView: reusableView2, to: view4)
        reusableView2.color = UIColor.brown
        reusableView2.labelText = "Brown"
        
        view1.labelText = "Red"
    }
    
    private func add(reusableView: ReusableView, to view: UIView) {
        reusableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reusableView)
        reusableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        reusableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        reusableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        reusableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
