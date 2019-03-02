//
//  ViewController.swift
//  CatanProbability
//
//  Created by Eric Collom on 2/15/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class ProbabilityVC: UIViewController {
    
    var probabilityViewModel = ProbabilityViewModel()
    var contentView = ProbabilityView()
    var header = ProbabilityHeaderView()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        
        probabilityViewModel.configure(view: header)
        probabilityViewModel.configure(view: contentView)
        
        contentView.add.addTarget(self, action: #selector(addHex), for: .touchUpInside)
        
        self.view.addSubview(header)
        self.view.addSubview(contentView)
        
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @objc func addHex() {
        self.performSegue(withIdentifier: "addHex", sender: nil)
    }
    
    func add(hex: Hex) {
        probabilityViewModel.add(hex: hex)
        probabilityViewModel.configure(view: contentView)
        probabilityViewModel.configure(view: header)
    }
}

