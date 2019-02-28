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
        
        let hexSize = HexButton.size
        
        let horizontalExtraSpace = frame.width - (hexSize.width * 2)
        let horizontalHexSpacing: CGFloat = 7
        
        let sidePadding = (horizontalExtraSpace - horizontalHexSpacing) / 2
        let sidePaddingFromHexCenter = sidePadding + (hexSize.width / 2)
        
        let verticalExtraSpace = frame.height - (hexSize.height * 2) - 76
        
        let paddingTopFromHexCenter = ((verticalExtraSpace - 8) / 2) + (hexSize.height / 2)
        
        woodButton.center = CGPoint(x: sidePaddingFromHexCenter , y: paddingTopFromHexCenter)
        brickButton.center = CGPoint(x: frame.width - sidePaddingFromHexCenter, y: paddingTopFromHexCenter)
        
        let center = CGPoint(x: frame.width/2, y: frame.height/2)
        grainButton.center = center
        
        oreButton.center = CGPoint(x: sidePaddingFromHexCenter, y: frame.height - paddingTopFromHexCenter)
        
        woolButton.center = CGPoint(x: frame.width - sidePaddingFromHexCenter, y: frame.height - paddingTopFromHexCenter)
        
        add = UIButton(frame: CGRect(x: frame.width - (sidePadding + 55), y: center.y - (75 / 2), width:  55, height: 75))
        
        add.imageView?.contentMode = .scaleAspectFit
        let plus = UIImage(named: "Plus")
        add.setImage(plus , for: .normal)
        
        
        remove = UIButton(frame: CGRect(x: sidePadding, y: center.y - (75 / 2), width: 55, height: 75))
        
        remove.imageView?.contentMode = .scaleAspectFit
        let minus = UIImage(named: "Minus")
        remove.setImage(minus, for: .normal)
        
        
        
        self.addSubview(woodButton)
        self.addSubview(brickButton)
        self.addSubview(grainButton)
        self.addSubview(oreButton)
        self.addSubview(woolButton)
        self.addSubview(add)
        self.addSubview(remove)
        
    }
    
}
