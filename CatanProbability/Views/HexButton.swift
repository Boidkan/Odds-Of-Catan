//
//  HexView.swift
//  CatanProbability
//
//  Created by Eric Collom on 2/26/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class HexButton: UIButton {
    
    var icon:UIImageView!
    var probability:UILabel?
    
    class var size: CGSize {
        get {
            
            return CGSize(width: 130, height: 151)
        }
    }
    
    convenience init() {
        self.init(iconOnly: false)
    }
    
    convenience init(iconOnly: Bool) {
        let frame = CGRect(origin: .zero, size: HexButton.size)
        self.init(frame: frame)
        
        if iconOnly {
            icon = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 80, height: 80)))
            icon.center = self.center
        }else{
            icon = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 60, height: 60)))
            icon.center = CGPoint(x: self.center.x, y: self.center.y - 20)
            
            probability = UILabel(frame: CGRect(x: 5, y: 90, width: 125, height: 30))
            probability!.font = UIFont.systemFont(ofSize: 24)
            probability!.textAlignment = .center
            probability!.textColor = .white
            self.addSubview(probability!)
        }
        
        icon.contentMode = .scaleAspectFit
        self.addSubview(icon)
        
    }
    
    
    
}
