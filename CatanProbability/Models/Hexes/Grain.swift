//
//  Grain.swift
//  CatanProbability
//
//  Created by Eric Collom on 2/27/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import Foundation

class Grain: Hex {
    private(set) var type: ResourceType
    var number: Number
    
    init(number:Number) {
        self.number = number
        self.type = .grain
    }
}
