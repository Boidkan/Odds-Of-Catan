//
//  BackButton.swift
//  CatanProbability
//
//  Created by Eric Collom on 3/6/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class BackButton: UIButton {

    private var angle: UIImageView!
    private var title:UILabel!
    
    init() {
        
        super.init(frame: CGRect(x: 0, y: 0, width: 76, height: 30))
        
        angle = UIImageView()
        angle.frame = CGRect(x: 0, y: 0, width: 17.6, height: 30)
        angle.image = UIImage(named: "BackAngle")
        
        title = UILabel(frame: CGRect(x: angle.bounds.width + 5, y: 0, width: 50, height: 30))
        title.textColor = ColorPalette.shared.red
        title.text = "Back"
        title.font = UIFont.systemFont(ofSize: 22)
        
        self.addSubview(angle)
        self.addSubview(title)
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
