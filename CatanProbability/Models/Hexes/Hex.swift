//
//  Hex.swift
//  CatanProbability
//
//  Created by Eric Collom on 2/15/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit




protocol Hex {
    var type: ResourceType { get }
    var number: Number { get set }
}

extension Sequence where Iterator.Element: Hex {
    
    func collectUniqueNumbers(seen: inout [Number]) {
        for item in self {
            if !seen.contains(item.number) {
                seen.append(item.number)
            }
        }
    }
    
    func unique() -> [Hex] {
        var seen: [Int: Bool] = [:]
        return self.filter { seen.updateValue(true, forKey: $0.number.rawValue) == nil }
    }

    
    var probability: String {
        let uniqueValues = self.unique()
        let probability = uniqueValues.reduce(0) { $0 + $1.number.probability } as NSNumber
        return (Formatters.shared.decimalFormatter.string(from: probability) ?? "0") + "%"
    }
    

}





