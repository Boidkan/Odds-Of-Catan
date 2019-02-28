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
    var probabilityView = ProbabilityView()
    var header = Header()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        
        probabilityViewModel.configure(view: header)
        probabilityViewModel.configure(view: probabilityView)
        
        self.view.addSubview(header)
        self.view.addSubview(probabilityView)
        
    }


}

