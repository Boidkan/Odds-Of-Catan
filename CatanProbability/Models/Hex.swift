//
//  Hex.swift
//  CatanProbability
//
//  Created by Eric Collom on 2/15/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

enum ResourceType:String {
    
    case forest = "Forest",
         grain = "Grain",
         brick = "Brick",
         ore = "Ore",
         wool = "Wool"
    
    var name: String {
        get {
            return self.rawValue
        }
    }
    
    //TODO: Design resorce images and Implement
    var image: UIImage {
        get {
            return UIImage()
        }
    }
    
    //TODO: Select the colors for each resorce Implement
    var color: UIColor {
        get {
            return UIColor()
        }
    }
}

struct Hex {
    var type: ResorceType!
    var number: Number!
}
