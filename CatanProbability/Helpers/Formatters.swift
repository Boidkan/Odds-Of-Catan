//
//  Formatters.swift
//  CatanProbability
//
//  Created by Eric Collom on 2/27/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import Foundation

class Formatters {
    static let shared = Formatters()
    
    let decimalFormatter = NumberFormatter()
    
    private init() {
        decimalFormatter.numberStyle = .decimal
        decimalFormatter.minimumFractionDigits = 0
        decimalFormatter.maximumFractionDigits = 2
    }
}
