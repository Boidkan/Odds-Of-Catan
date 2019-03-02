//
//  Number.swift
//  CatanProbability
//
//  Created by Eric Collom on 2/27/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

enum Number: Int {
    
    case two = 2, three = 3, four = 4, five = 5, six = 6, seven = 7
    case eight = 8, nine = 9, ten = 10, eleven = 11, twelve = 12
    
    var probability: CGFloat {
        get {
            return self.combinations/36
        }
    }
    
    var combinations: CGFloat {
        get {
            switch self {
            case .two, .twelve:
                return 1
            case .three, .eleven:
                return 2
            case .four, .ten:
                return 3
            case .five, .nine:
                return 4
            case .six, .eight:
                return 5
            case .seven:
                return 6
            }
        }
    }
    
    var diceImage: UIImage? {
        get {
            let name = "\(self.rawValue)dice"
            return UIImage(named: name)
        }
    }
}


