//
//  ProbabilityViewModel.swift
//  CatanProbability
//
//  Created by Eric Collom on 2/27/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class ProbabilityViewModel {
    
    var wood: [Wood] = []
    var ores: [Ore] = []
    var bricks: [Brick] = []
    var grains: [Grain] = []
    var wool: [Wool] = []
    
    var averageCardsDrawnPerTurn: String {
        let numerator = wood.reduce(0) { $0 + $1.number.combinations } +
                        ores.reduce(0) { $0 + $1.number.combinations } +
                        bricks.reduce(0) { $0 + $1.number.combinations } +
                        grains.reduce(0) { $0 + $1.number.combinations } +
                        wool.reduce(0) { $0 + $1.number.combinations }
        let probability = numerator/36 as NSNumber
        return Formatters.shared.decimalFormatter.string(from: probability) ?? "0"
    }
    
    var diceProbability: String {
        var seen: [Number] = []
        
        wood.collectUniqueNumbers(seen: &seen)
        ores.collectUniqueNumbers(seen: &seen)
        bricks.collectUniqueNumbers(seen: &seen)
        grains.collectUniqueNumbers(seen: &seen)
        wool.collectUniqueNumbers(seen: &seen)
        let probability = seen.reduce(0) { $0 + $1.probability } as NSNumber
        return (Formatters.shared.decimalFormatter.string(from: probability) ?? "0") + "%"
    }
    
}

extension ProbabilityViewModel {
    
    func add(hex: Hex) {
        if hex is Wood {
            wood.append(hex as! Wood)
        }else if hex is Ore {
            ores.append(hex as! Ore)
        }else if hex is Wool {
            wool.append(hex as! Wool)
        }else if hex is Grain {
            grains.append(hex as! Grain)
        }else if hex is Brick {
            bricks.append(hex as! Brick)
        }
    }
    
    func configure(view: ProbabilityView) {
        
        view.brickButton.probability?.text = bricks.probability
        view.oreButton.probability?.text = ores.probability
        view.grainButton.probability?.text = grains.probability
        view.woodButton.probability?.text = wood.probability
        view.woolButton.probability?.text = wool.probability
        
    }
    
    func configure(view: ProbabilityHeaderView) {

        view.setDiceProbability(text: diceProbability)
        view.diceDetail.text = "chance of getting a number"
        
        view.setCardAverage(text: averageCardsDrawnPerTurn)
        view.cardAverageDetail.text = "cards on average per turn"
    }
    
    func clear() {
        wood = []
        ores = []
        grains = []
        wool = []
        bricks = []
    }
}
