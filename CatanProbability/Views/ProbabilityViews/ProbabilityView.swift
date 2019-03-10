//
//  ProbabilityView.swift
//  CatanProbability
//
//  Created by Eric Collom on 2/26/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class ProbabilityView: HexesView {
    
    var eraser:UIButton!
    
    var add:UIButton!
    var remove:UIButton!
    
    override func setup() {
        super.setup()
        eraser = UIButton(frame: CGRect(x: self.bounds.width - (20 + 35) , y: 20, width: 35, height: 30))
        eraser.setImage(UIImage(named: "Eraser"), for: .normal)
        
        let hexSize = HexButton.size
        
        let horizontalExtraSpace = frame.width - (hexSize.width * 2)
        let horizontalHexSpacing: CGFloat = 7
        
        let sidePadding = (horizontalExtraSpace - horizontalHexSpacing) / 2
        
        add = UIButton(frame: CGRect(x: frame.width - (sidePadding + 55), y: (bounds.height / 2) - (75 / 2), width:  55, height: 75))
        
        add.imageView?.contentMode = .scaleAspectFit
        let plus = UIImage(named: "Plus")
        add.setImage(plus , for: .normal)
        
        
        remove = UIButton(frame: CGRect(x: sidePadding, y: (bounds.height / 2) - (75 / 2), width: 55, height: 75))
        
        remove.imageView?.contentMode = .scaleAspectFit
        let minus = UIImage(named: "Minus")
        remove.setImage(minus, for: .normal)
        
        
        self.addSubview(eraser)
        self.addSubview(add)
        self.addSubview(remove)
        
    }
    
}
