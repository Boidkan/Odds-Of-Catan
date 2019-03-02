//
//  AddHeaderView.swift
//  CatanProbability
//
//  Created by Eric Collom on 3/1/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class AddHexHeaderView: HeaderView {
    
    var instructions:UILabel!
    
    override func setup() {
        
        let frame = CGRect(x: 20, y: 70, width: self.bounds.width - 40, height: 90)
        instructions = UILabel(frame: frame)
        instructions.textColor = .white
        instructions.textAlignment = .center
        instructions.font = UIFont.systemFont(ofSize: 36, weight: .light)
        instructions.numberOfLines = 0
        instructions.lineBreakMode = .byWordWrapping
        
        self.addSubview(instructions)
    }
    
    
}
