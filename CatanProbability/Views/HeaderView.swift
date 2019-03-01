//
//  HeaderView.swift
//  CatanProbability
//
//  Created by Eric Collom on 3/1/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

protocol Header {
    func setup()
}

class HeaderView: UIView, Header {
    
    convenience init() {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height / 3
        let size = CGSize(width: width, height: height)
        
        self.init(frame: CGRect(origin: .zero, size: size))
        
        self.backgroundColor = UIColor(red: 190/255, green: 35/255, blue: 52/255, alpha: 1)
        setup()
    }
    
    func setup() {}

}
