//
//  Header.swift
//  CatanProbability
//
//  Created by Eric Collom on 2/26/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class Header: UIView {
    
    var label:UILabel!
    var detailLabel:UILabel!
    
    convenience init() {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height/3
        let size = CGSize(width: width, height: height)
        
        self.init(frame: CGRect(origin: .zero, size: size))
        
        label = UILabel(frame: CGRect(x: 0, y: 60, width: width, height: 40))
        label.font = UIFont.systemFont(ofSize: 48, weight: .light)
        label.textColor = .white
        label.textAlignment = .center
        
        detailLabel = UILabel(frame: CGRect(x: 0, y: 110, width: width, height: 25))
        
        detailLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        detailLabel.textColor = .white
        detailLabel.textAlignment = .center
        
        self.addSubview(label)
        self.addSubview(detailLabel)
        
        self.backgroundColor = UIColor(red: 190/255, green: 35/255, blue: 52/255, alpha: 1)
    }

}
