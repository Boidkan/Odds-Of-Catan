//
//  ProbabilityView.swift
//  CatanProbability
//
//  Created by Eric Collom on 2/26/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class ProbabilityView: UIView {

    var woodButton: HexButton = HexButton()
    var oreButton: HexButton = HexButton()
    var brickButton: HexButton = HexButton()
    var woolButton: HexButton = HexButton()
    var grainButton: HexButton = HexButton()
    var add:UIButton!
    var remove:UIButton!
    
    private var paddingTop = 90
    
    convenience init() {
        let bounds = UIScreen.main.bounds
        let frame = CGRect(x: 10, y: 180, width: bounds.width - 20, height: bounds.height -  200)
        self.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 5
        
        woodButton.center = CGPoint(x: 40 + 65, y: 90 + 75)
        brickButton.center = CGPoint(x: 40 + 130 + 8 + 65, y: 90 + 75)
        grainButton.center = CGPoint(x: 40 + 130 + 4, y: 90 + 150 - 32 + 75)
        oreButton.center = CGPoint(x: 40 + 65, y: 90 + 150 + 85 + 75)
        woolButton.center = CGPoint(x: 40 + 130 + 8 + 65, y: 90 + 150 + 85 + 75)
        
        add = UIButton(frame: CGRect(x: frame.width - (45 + 55), y: 90 + 150 - 32 + 75 - 27.5, width: 55, height: 55))
        
        add.setBackgroundImage(UIImage(named: "Plus"), for: .normal)
        
        remove = UIButton(frame: CGRect(x: 45, y: 90 + 150 - 32 + 75 - 3.5, width: 55, height: 7))
        remove.setBackgroundImage(UIImage(named: "Minus"), for: .normal)
        
        
        self.addSubview(woodButton)
        self.addSubview(brickButton)
        self.addSubview(grainButton)
        self.addSubview(oreButton)
        self.addSubview(woolButton)
        self.addSubview(add)
        self.addSubview(remove)
        
    }
    
}
