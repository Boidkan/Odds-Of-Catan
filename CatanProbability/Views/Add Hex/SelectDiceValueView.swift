//
//  SelectDiceValueView.swift
//  CatanProbability
//
//  Created by Eric Collom on 3/1/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class SelectDiceValueView: ContentView {

    var twoDice = DiceButton(type: .two)
    var threeDice = DiceButton(type: .three)
    var fourDice = DiceButton(type: .four)
    var fiveDice = DiceButton(type: .five)
    var sixDice = DiceButton(type: .six)
    var eightDice = DiceButton(type: .eight)
    var nineDice = DiceButton(type: .nine)
    var tenDice = DiceButton(type: .ten)
    var elevenDice = DiceButton(type: .eleven)
    var twelveDice = DiceButton(type: .twelve)
    
    override func setup() {
        
        let width:CGFloat = 60
        
        let extraSpace = self.bounds.width - (4 * width)
        let padding = extraSpace/5
        
        var centerX = padding + (width / 2)
        var centerY:CGFloat = 100
        
        twoDice.center = CGPoint(x: centerX, y: centerY)
        centerX += width + padding
        
        threeDice.center = CGPoint(x: centerX, y: centerY)
        centerX += width + padding
        
        fourDice.center = CGPoint(x: centerX, y: centerY)
        centerX += width + padding
        
        fiveDice.center = CGPoint(x: centerX, y: centerY)
        centerX += width + padding
        //85
        //self.center.x - (42.5 + 30)
        sixDice.center = CGPoint(x: self.center.x - (42.5 + 20), y: centerY + 80 + 50)
        eightDice.center = CGPoint(x: self.center.x + (42.5 + 10), y: centerY + 80 + 50)
        
        centerX = padding + (width / 2)
        centerY = centerY + 80 + 50 + 80 + 50
        
        nineDice.center = CGPoint(x: centerX, y: centerY)
        centerX += width + padding
        
        tenDice.center = CGPoint(x: centerX, y: centerY)
        centerX += width + padding
        
        elevenDice.center = CGPoint(x: centerX, y: centerY)
        centerX += width + padding
        
        twelveDice.center = CGPoint(x: centerX, y: centerY)
        centerX += width + padding
        
        self.addSubview(twoDice)
        self.addSubview(threeDice)
        self.addSubview(fourDice)
        self.addSubview(fiveDice)
        self.addSubview(sixDice)
        self.addSubview(eightDice)
        self.addSubview(nineDice)
        self.addSubview(tenDice)
        self.addSubview(elevenDice)
        self.addSubview(twelveDice)
        
    }
}
