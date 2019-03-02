//
//  AddHexView.swift
//  CatanProbability
//
//  Created by Eric Collom on 3/1/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class AddHexView: ContentView {

    var woodButton = HexButton(type: .wood, iconOnly: true)
    var oreButton = HexButton(type: .ore, iconOnly: true)
    var brickButton = HexButton(type: .brick, iconOnly: true)
    var woolButton = HexButton(type: .wool, iconOnly: true)
    var grainButton = HexButton(type: .grain, iconOnly: true)
    
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
