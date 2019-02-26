//
//  ProbabilityType.swift
//  CatanProbability
//
//  Created by Eric Collom on 2/15/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

//Total     Number of
//Combinations     Probability
     //2     1     2.78%
     //3     2     5.56%
     //4     3     8.33%
     //5     4     11.11%
     //6     5     13.89%
     //7     6     16.67%
     //8     5     13.89%
     //9     4     11.11%
    //10     3     8.33%
    //11     2     5.56%
    //12     1     2.78%
 //Total     36     100%

enum Number: Int {
    case two = 2, three = 3, four = 4, five = 5, six = 6, seven = 7
    case eight = 8, nine = 9, ten = 10, eleven = 11, twelve = 12
    
    var probability: CGFloat {
        get {
            return self.combinations/36
        }
    }
    
    private var combinations: CGFloat {
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
}



