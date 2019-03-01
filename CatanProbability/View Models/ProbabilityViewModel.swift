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
    
    var averageCardsDrawnPerTurn: CGFloat {
        let numerator = wood.reduce(0) { $0 + $1.number.combinations } +
                        ores.reduce(0) { $0 + $1.number.combinations } +
                        bricks.reduce(0) { $0 + $1.number.combinations } +
                        grains.reduce(0) { $0 + $1.number.combinations } +
                        wool.reduce(0) { $0 + $1.number.combinations }
    
        return numerator/36
    }
    
    var diceProbability: CGFloat {
        var seen: [Number] = []
        
        wood.collectUniqueNumbers(seen: &seen)
        ores.collectUniqueNumbers(seen: &seen)
        bricks.collectUniqueNumbers(seen: &seen)
        grains.collectUniqueNumbers(seen: &seen)
        wool.collectUniqueNumbers(seen: &seen)
        
        return seen.reduce(0) { $0 + $1.probability }
    }
    
    func icon(for type: ResourceType) -> UIImage? {
        return UIImage(named: type.rawValue)
    }
    
    func background(for type: ResourceType) -> UIImage? {
        return UIImage(named: type.rawValue + "Hex")
    }
    
}

extension ProbabilityViewModel {
    
    func configure(view: ProbabilityView) {
        
        view.brickButton.icon.image = icon(for: .brick)
        view.oreButton.icon.image = icon(for: .ore)
        view.grainButton.icon.image = icon(for: .grain)
        view.woodButton.icon.image = icon(for: .wood)
        view.woolButton.icon.image = icon(for: .wool)
        
        
        view.brickButton.setImage(background(for: .brick), for: .normal)
        view.oreButton.setImage(background(for: .ore), for: .normal)
        view.grainButton.setImage(background(for: .grain), for: .normal)
        view.woodButton.setImage(background(for: .wood), for: .normal)
        view.woolButton.setImage(background(for: .wool), for: .normal)
        
        view.brickButton.probability.text = bricks.probability
        view.oreButton.probability.text = ores.probability
        view.grainButton.probability.text = grains.probability
        view.woodButton.probability.text = wood.probability
        view.woolButton.probability.text = wool.probability
        
    }
    
    func configure(view: ProbabilityHeaderView) {

        view.setDiceProbability(text: "\(diceProbability)")
        view.diceDetail.text = "chance of getting a number"
        
        view.setCardAverage(text: "\(averageCardsDrawnPerTurn)")
        view.cardAverageDetail.text = "cards on average per turn"
    }
}
