//
//  ContentView.swift
//  CatanProbability
//
//  Created by Eric Collom on 3/1/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

protocol Content {
    func setup()
}

class ContentView: UIView {
    
    convenience init() {
        let bounds = UIScreen.main.bounds
        let frame = CGRect(x: 10, y: 180, width: bounds.width - 20, height: bounds.height -  200)
        self.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 5
        
        setup()
    }

    func setup() {}

}
