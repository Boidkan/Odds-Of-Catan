//
//  AddHexViewModel.swift
//  CatanProbability
//
//  Created by Eric Collom on 3/1/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import Foundation

class AddHexViewModel {
    
    
    
    
}

extension AddHexViewModel {
    
    func configure(view: AddHexView) {}
    func configure(view: SelectDiceValueView) {}
    
    func configure(view: AddHexHeaderView) {
        view.instructions.text = "Select a resource to add."
    }
}
