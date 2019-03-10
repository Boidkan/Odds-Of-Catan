//
//  HexView.swift
//  CatanProbability
//
//  Created by Eric Collom on 2/26/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class HexButton: UIButton {
    
    var icon: UIImageView!
    var probability: UILabel?
    var type: ResourceType?
    
    class var size: CGSize {
        get {
            
            return CGSize(width: 130, height: 151)
        }
    }
    
    convenience init(type:ResourceType, iconOnly: Bool) {
        self.init(iconOnly: iconOnly)
        set(type: type)
    }
    
    convenience init(type:ResourceType) {
        self.init(iconOnly: false)
        set(type: type)
    }
    
    private convenience init(iconOnly: Bool) {
        
        let frame = CGRect(origin: .zero, size: HexButton.size)
        self.init(frame: frame)
        
        probability = UILabel(frame: CGRect(x: 5, y: 90, width: 125, height: 30))
        probability?.font = UIFont.systemFont(ofSize: 24)
        probability?.textAlignment = .center
        probability?.textColor = .white
        
        if iconOnly {
            icon = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 80, height: 80)))
            icon.center = self.center
            probability?.alpha = 0
        }else{
            icon = UIImageView(frame:CGRect(origin: .zero, size: CGSize(width: 60, height: 60)))
            icon.center = CGPoint(x: self.bounds.width / 2, y: (self.bounds.height / 2) - 20)
        }
        
        icon.contentMode = .scaleAspectFit
        self.addSubview(icon)
        self.addSubview(probability!)
    }
    
    func set(type: ResourceType) {
        self.type = type
        self.icon.image = type.icon
        self.setImage(type.background, for: .normal)
    }
    
    func hideLabel() {
        icon.frame = CGRect(origin: .zero, size: CGSize(width: 80, height: 80))
        icon.center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        probability?.alpha = 0
    }
}
