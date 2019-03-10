//
//  AddHexView.swift
//  CatanProbability
//
//  Created by Eric Collom on 3/1/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class AddHexView: HexesView {
    
    var cancelButton:UIButton!
    
    override func setup() {
        super.setup()
        cancelButton = UIButton(frame: CGRect(x: frame.width - 55, y: 20, width: 35, height: 30))
        cancelButton.setImage(UIImage(named: "Cancel"), for: .normal)
        
        self.addSubview(cancelButton)
    
    }

}
