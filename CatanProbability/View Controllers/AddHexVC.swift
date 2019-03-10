//
//  AddHexVC.swift
//  CatanProbability
//
//  Created by Eric Collom on 3/1/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class AddHexVC: UIViewController {
    
    var contentHolder = UIView()
    var header = AddHexHeaderView()
    var selectHexView = AddHexView()
    var selectDiceValueView = SelectDiceValueView()
    var viewModel = AddHexViewModel()
    
    private var resourceTypeSelected:ResourceType?
    private var isFlipped = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray
        
        viewModel.configure(view: header)
        viewModel.configure(view: selectHexView)
        viewModel.configure(view: selectDiceValueView)
        
        selectHexView.brickButton.addTarget(self, action: #selector(selectedHex(sender:)), for: .touchUpInside)
        selectHexView.woodButton.addTarget(self, action: #selector(selectedHex(sender:)), for: .touchUpInside)
        selectHexView.grainButton.addTarget(self, action: #selector(selectedHex(sender:)), for: .touchUpInside)
        selectHexView.woolButton.addTarget(self, action: #selector(selectedHex(sender:)), for: .touchUpInside)
        selectHexView.oreButton.addTarget(self, action: #selector(selectedHex(sender:)), for: .touchUpInside)
        
        selectDiceValueView.twoDice.addTarget(self, action: #selector(selectedNumber(sender:)), for: .touchUpInside)
        selectDiceValueView.threeDice.addTarget(self, action: #selector(selectedNumber(sender:)), for: .touchUpInside)
        selectDiceValueView.fourDice.addTarget(self, action: #selector(selectedNumber(sender:)), for: .touchUpInside)
        selectDiceValueView.fiveDice.addTarget(self, action: #selector(selectedNumber(sender:)), for: .touchUpInside)
        selectDiceValueView.sixDice.addTarget(self, action: #selector(selectedNumber(sender:)), for: .touchUpInside)
        selectDiceValueView.eightDice.addTarget(self, action: #selector(selectedNumber(sender:)), for: .touchUpInside)
        selectDiceValueView.nineDice.addTarget(self, action: #selector(selectedNumber(sender:)), for: .touchUpInside)
        selectDiceValueView.tenDice.addTarget(self, action: #selector(selectedNumber(sender:)), for: .touchUpInside)
        selectDiceValueView.elevenDice.addTarget(self, action: #selector(selectedNumber(sender:)), for: .touchUpInside)
        selectDiceValueView.twelveDice.addTarget(self, action: #selector(selectedNumber(sender:)), for: .touchUpInside)
        
        selectHexView.cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        selectDiceValueView.cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        selectDiceValueView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        contentHolder.frame = self.view.bounds
        contentHolder.backgroundColor = .clear

        self.view.addSubview(header)
        self.view.addSubview(contentHolder)
        self.contentHolder.addSubview(selectDiceValueView)
        self.contentHolder.addSubview(selectHexView)
        
    }
    
    @objc func selectedHex(sender: HexButton) {
        
        guard sender.type != nil else { return }
        
        resourceTypeSelected = sender.type!
        viewModel.swapHeaderFor(view: header)
        
        flip()
    }
    
    @objc func selectedNumber(sender button: DiceButton) {
        
        guard let stringValue = button.diceValue?.text else { return }//fatal?
        guard let intValue = Int(stringValue) else { return }//fatal?
        
        let number = Number(rawValue: intValue)!
        
        
        var hex:Hex!
        
        switch resourceTypeSelected! {
            
        case .wood:
            hex = Wood(number: number)
        case .ore:
            hex = Ore(number: number)
        case .brick:
            hex = Brick(number: number)
        case .wool:
            hex = Wool(number: number)
        case .grain:
            hex = Grain(number: number)
        }
        
        
        self.dismiss(animated: false) {
            if let vc = VCHierarchy.topMostContoller() as? ProbabilityVC {
                vc.add(hex: hex)
            }
        }
        
    }
    
    @objc func cancel() {
        resourceTypeSelected = nil
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func back() {
        resourceTypeSelected = nil
        viewModel.swapHeaderFor(view: header)
        flip()
    }
    
    func flip() {
        isFlipped = !isFlipped
        
        let viewToFlip = !isFlipped ? selectDiceValueView : selectHexView
        let bottomView = !isFlipped ? selectHexView : selectDiceValueView
        
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews, .curveEaseInOut]
        
        UIView.transition(from: viewToFlip, to: bottomView, duration: 0.5, options: transitionOptions, completion: nil)
    }

}
