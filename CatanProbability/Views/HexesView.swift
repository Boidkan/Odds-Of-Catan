//
//  HexesView.swift
//  CatanProbability
//
//  Created by Eric Collom on 3/9/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class HexesView: ContentView {
    
    private(set) var woodButton = HexButton(type: .wood)
    private(set) var oreButton = HexButton(type: .ore)
    private(set) var brickButton = HexButton(type: .brick)
    private(set) var woolButton = HexButton(type: .wool)
    private(set) var grainButton = HexButton(type: .grain)
    
    var hexes:[HexButton] {
        get {
            return [
                woodButton,
                oreButton,
                brickButton,
                woolButton,
                grainButton
            ]
        }
    }
    
    override func setup() {

        let hexSize = HexButton.size
        
        let horizontalExtraSpace = frame.width - (hexSize.width * 2)
        let horizontalHexSpacing: CGFloat = 7
        
        let sidePadding = (horizontalExtraSpace - horizontalHexSpacing) / 2
        let sidePaddingFromHexCenter = sidePadding + (hexSize.width / 2)
        
        let verticalExtraSpace = frame.height - (hexSize.height * 2) - 76
        
        let paddingTopFromHexCenter = ((verticalExtraSpace - 8) / 2) + (hexSize.height / 2)
        
        woodButton.center = CGPoint(x: sidePaddingFromHexCenter , y: paddingTopFromHexCenter)
        brickButton.center = CGPoint(x: frame.width - sidePaddingFromHexCenter, y: paddingTopFromHexCenter)
        
        let center = CGPoint(x: frame.width/2, y: frame.height/2)
        grainButton.center = center
        
        oreButton.center = CGPoint(x: sidePaddingFromHexCenter, y: frame.height - paddingTopFromHexCenter)
        
        woolButton.center = CGPoint(x: frame.width - sidePaddingFromHexCenter, y: frame.height - paddingTopFromHexCenter)
        
        self.addSubview(woodButton)
        self.addSubview(brickButton)
        self.addSubview(grainButton)
        self.addSubview(oreButton)
        self.addSubview(woolButton)
        
    }
}
