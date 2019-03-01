//
//  StringExtension.swift
//  CatanProbability
//
//  Created by Eric Collom on 3/1/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

extension String {
    func size(_ font: UIFont) -> CGSize {
        #if swift(>=4)
        return NSAttributedString(string: self, attributes: [NSAttributedString.Key.font: font]).size()
        #else
        return NSAttributedString(string: self, attributes: [NSFontAttributeName: font]).size()
        #endif
    }
    
    func width(_ font: UIFont) -> CGFloat {
        return size(font).width
    }
    
    func height(_ font: UIFont) -> CGFloat {
        return size(font).height
    }
}
