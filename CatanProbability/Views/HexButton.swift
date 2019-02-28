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
    var probability:UILabel!
    
    convenience init() {
        let frame = CGRect(origin: .zero, size: CGSize(width: 130, height: 151))
        self.init(frame: frame)

        icon = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 60, height: 60)))
        icon.center = CGPoint(x: self.center.x, y: self.center.y - 20)
        icon.contentMode = .scaleAspectFit
        
        probability = UILabel(frame: CGRect(x: 5, y: 90, width: 125, height: 30))
        
        probability.font = UIFont.systemFont(ofSize: 24)
        probability.textAlignment = .center
        probability.textColor = .white
        
        self.addSubview(icon)
        self.addSubview(probability)
    }
    
}
