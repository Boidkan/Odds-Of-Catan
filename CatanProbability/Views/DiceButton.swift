//
//  DieButton.swift
//  CatanProbability
//
//  Created by Eric Collom on 3/1/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class DiceButton: UIButton {
    
    var diceImage:UIImageView!
    var diceValue:UILabel!
    
    convenience init(type: Number) {
        let frame = CGRect(x: 0, y: 0, width: 60, height: 80)
        self.init(frame: frame)
        
        diceImage = UIImageView(image: type.diceImage)
        diceImage.center = CGPoint(x: 30, y: 22.5)
        diceValue = UILabel(frame: CGRect(x: 0, y: 45, width: 60, height: 35))
        diceValue.text = String(type.rawValue)
        diceValue.textAlignment = .center
        diceValue.textColor = textColor(for: type.rawValue)
        
        self.diceValue.font = UIFont.systemFont(ofSize: fontSize(for: type.rawValue), weight: .light)
        
        self.addSubview(diceImage)
        self.addSubview(diceValue)
    }
    
    func textColor(for value: Int) -> UIColor {
        if value == 6 || value == 8 {
            return ColorPalette.shared.red
        }
        
        return .black
    }
    
    func fontSize(for value: Int) -> CGFloat{
        if value < 8 {
            return CGFloat(10 + (value * 4))
        }else{
            return CGFloat(66 - (value * 4))
        }
    }
}
