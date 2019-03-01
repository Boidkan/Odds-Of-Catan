//
//  AddHexVC.swift
//  CatanProbability
//
//  Created by Eric Collom on 3/1/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class AddHexVC: UIViewController {
    
    var header = AddHexHeaderView()
    var contentView = AddHexView()
    var viewModel = AddHexViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.configure(view: header)
        viewModel.configure(view: contentView)

        self.view.addSubview(header)
        self.view.addSubview(contentView)
    }

}
