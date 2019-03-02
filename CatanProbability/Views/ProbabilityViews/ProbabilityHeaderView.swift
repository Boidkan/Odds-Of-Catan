//
//  Header.swift
//  CatanProbability
//
//  Created by Eric Collom on 2/26/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class ProbabilityHeaderView: HeaderView {
    
    private(set) var diceIcon:UIImageView!
    private(set) var cardsIcon:UIImageView!
    
    private(set) var diceProbability:UILabel!
    private(set) var diceDetail:UILabel!
    
    private(set) var cardAverage:UILabel!
    private(set) var cardAverageDetail:UILabel!
    
    override func setup() {
        
        let width = self.bounds.width
        
        var cardsX:CGFloat = (width / 2) + 20
        var diceX:CGFloat = 20
        let y:CGFloat = 70
        
        cardsIcon = UIImageView(image: UIImage(named: "Cards"))
        cardsIcon.frame = CGRect(x: cardsX, y: y + 3, width: 40, height: 30)
        cardsIcon.contentMode = .scaleAspectFit
        
        cardsX += cardsIcon.bounds.width + 5
        
        cardAverage = UILabel(frame: CGRect(x: cardsX, y: y, width: 80, height: 40))
        cardAverage.font = UIFont.systemFont(ofSize: 32, weight: .light)
        cardAverage.textColor = .white
        
        cardsX += cardAverage.bounds.width + 5
        
        cardAverageDetail = UILabel(frame: CGRect(x: (width / 2) + 20, y: y + cardAverage.bounds.height, width: (width/2) - 40 , height: 50))
        cardAverageDetail.font = UIFont.systemFont(ofSize: 18, weight: .light)
        cardAverageDetail.textColor = .white
        cardAverageDetail.numberOfLines = 0
        cardAverageDetail.lineBreakMode = .byWordWrapping
        cardAverageDetail.textAlignment = .center
        
        diceIcon = UIImageView(image: UIImage(named: "Dice"))
        diceIcon.frame = CGRect(x: diceX, y: y + 3, width: 37, height: 30)
        diceIcon.contentMode = .scaleAspectFit
        diceX += diceIcon.bounds.width + 5
        
        diceProbability = UILabel(frame: CGRect(x: diceX, y: y, width: 80, height: 40))
        diceProbability.font = UIFont.systemFont(ofSize: 32, weight: .light)
        diceProbability.textColor = .white
        
        diceX += diceProbability.bounds.width + 5
        
        diceDetail = UILabel(frame: CGRect(x: 20, y: y + diceProbability.bounds.height , width: (width/2) - 40 , height: 50))
        diceDetail.font = UIFont.systemFont(ofSize: 18, weight: .light)
        diceDetail.textColor = .white
        diceDetail.numberOfLines = 0
        diceDetail.lineBreakMode = .byWordWrapping
        diceDetail.textAlignment = .center
        
        self.addSubview(cardsIcon)
        self.addSubview(cardAverage)
        self.addSubview(cardAverageDetail)
        
        self.addSubview(diceIcon)
        self.addSubview(diceProbability)
        self.addSubview(diceDetail)
        
    }
    
    func setDiceProbability(text:String) {
        let textSize = text.size(diceProbability.font)
        let iconWidth = diceIcon.bounds.width
        
        let horizontalSpace = (UIScreen.main.bounds.width / 2) - 40
        
        let padding = (horizontalSpace - (iconWidth + textSize.width + 5)) / 2
        
        diceIcon.frame.origin = CGPoint(x: 20 + padding, y: 73)
        diceProbability.frame.origin = CGPoint(x: 20 + padding + diceIcon.bounds.width + 5, y: 70)
        diceProbability.text = text
    }
    
    func setCardAverage(text: String) {
        let textSize = text.size(cardAverage.font)
        let iconWidth = cardsIcon.bounds.width
        
        let horizontalSpace = (self.bounds.width/2) - 40
        
        let x = (UIScreen.main.bounds.width / 2) + 20
        
        let padding = (horizontalSpace - (iconWidth + textSize.width + 5)) / 2
        
        cardsIcon.frame.origin = CGPoint(x: x + padding, y: 73)
        cardAverage.frame.origin = CGPoint(x: x + padding + cardsIcon.bounds.width + 5, y: 70)
        cardAverage.text = text
    }

}
