//
//  HexIconsAnimator.swift
//  CatanProbability
//
//  Created by Eric Collom on 3/9/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class HexIconsAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var duration:Double = 0.2
    var presenting = true
    
    var dismissCompletion: (()->Void)?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        
        let toVC = transitionContext.viewController(forKey: .to)!
        let fromVC = transitionContext.viewController(forKey: .from)!
        
        let probVC = (presenting ? fromVC : toVC) as! ProbabilityVC
        let vc = (presenting ? toVC : fromVC) as! AddHexVC
        let view = vc.view!
        
        let size = HexButton.size
        
        let initialCenter = CGPoint(x: size.width / 2, y: (size.height / 2) - 20)
        let finalCenter = CGPoint(x: size.width / 2, y: size.height / 2)
        
        let initialFrame = CGRect(x: size.width / 2, y: (size.height / 2) - 20, width: 60, height: 60)
        let finalFrame = CGRect(x: size.width / 2, y: size.height / 2, width: 80, height: 80)
        
        let frame = presenting ? finalFrame : initialFrame
        let center = presenting ? finalCenter : initialCenter
        let iconAlpha: CGFloat = presenting ? 0 : 1
        let headerAlpha: CGFloat = presenting ? 1 : 0
        
        if !containerView.subviews.contains(probVC.view) {
            containerView.addSubview(probVC.view!)
        }
        
        containerView.addSubview(view)
        containerView.bringSubviewToFront(view)
    
        UIView.animate(withDuration: duration, animations: {
            vc.selectHexView.hexes.forEach {
                $0.icon.frame = frame
                $0.icon.center = center
                $0.probability?.alpha = iconAlpha
            }
            
            vc.header.instructions.alpha = headerAlpha
            vc.selectHexView.cancelButton.alpha = headerAlpha
            
        }, completion: { _ in
            if !self.presenting {
                self.dismissCompletion?()
            }
            transitionContext.completeTransition(true)
        })
    }
}




