//
//  HexView.swift
//  CatanProbability
//
//  Created by Eric Collom on 2/26/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class HexButton: UIButton {
    
    var icon: UIImageView!
    var probability: UILabel?
    var type: ResourceType?
    
    class var frame: CGRect {
        return CGRect(origin: .zero, size: size)
    }
    
    class var size: CGSize {
        return CGSize(width: width, height: height)
    }
    
    class var center: CGPoint {
        
        if UIScreen.main.bounds.width <= 375 {
            return CGPoint(x: width / 2, y: (height / 2) - 20)
        }
        
        return CGPoint(x: width / 2, y: height / 2)
    }
    
    class var width: CGFloat {
        if UIScreen.main.bounds.width <= 375 {
            return 80
        }else{
            return 130
        }
    }
    
    class var height: CGFloat {
        if UIScreen.main.bounds.width <= 375 {
            return 92
        }else{
            return 150
        }
    }
    
    class func iconFrame(isIconOnly: Bool = true) -> CGRect {
        return CGRect(origin: .zero, size: iconSize(isIconOnly: isIconOnly))
    }
    
    class func iconSize(isIconOnly: Bool) -> CGSize {
        return CGSize(width: iconWidth(isIconOnly: isIconOnly), height: iconHeight(isIconOnly: isIconOnly))
    }
    
    class func iconWidth(isIconOnly: Bool) -> CGFloat {
        return isIconOnly ? width / iconLargeWidthRatio : width / iconSmallWidthRatio
    }
    
    class func iconHeight(isIconOnly: Bool) -> CGFloat {
        return isIconOnly ? height / iconLargeHeightRatio : height / iconSmallHeightRatio
    }
    
    static let iconLargeWidthRatio: CGFloat = 130 / 80
    static let iconLargeHeightRatio: CGFloat = 150 / 80
    
    static let iconSmallWidthRatio: CGFloat = 130 / 60
    static let iconSmallHeightRatio: CGFloat = 150 / 60
    
    class var labelFrame: CGRect {
        let y = height / (150 / 90)
        return CGRect(x: 5, y: y, width: width - 10, height: 30)
    }
    
    
    
    
    convenience init(type:ResourceType, iconOnly: Bool) {
        self.init(iconOnly: iconOnly)
        set(type: type)
    }
    
    convenience init(type:ResourceType) {
        self.init(iconOnly: false)
        set(type: type)
    }
    
    private convenience init(iconOnly: Bool) {
        
        self.init(frame: HexButton.frame)
        probability = UILabel(frame: HexButton.labelFrame)
        probability?.font = UIFont.systemFont(ofSize: 24)
        probability?.textAlignment = .center
        probability?.textColor = .white
        
        icon = UIImageView(frame: HexButton.iconFrame(isIconOnly: iconOnly))
        icon.center = HexButton.center
        probability?.alpha = CGFloat(truncating: NSNumber(value: !iconOnly))
        
        icon.contentMode = .scaleAspectFit
        self.addSubview(icon)
        self.addSubview(probability!)
    }
    
    func set(type: ResourceType) {
        self.type = type
        self.icon.image = type.icon
        self.setImage(type.background, for: .normal)
    }
    
    func hideLabel() {
        icon.frame = HexButton.iconFrame()
        probability?.alpha = 0
    }
}
