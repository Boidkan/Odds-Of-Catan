//
//  HexIconsAnimator.swift
//  CatanProbability
//
//  Created by Eric Collom on 3/9/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class HexIconsAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var duration:Double = 0.15
    var presenting = true
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        
        let toVC = transitionContext.viewController(forKey: .to)!
        let fromVC = transitionContext.viewController(forKey: .from)!
        
        let probVC = (presenting ? fromVC : toVC) as! ProbabilityVC
        let hexVC = (presenting ? toVC : fromVC) as! AddHexVC

        let endView = presenting ? hexVC.view! : probVC.view!
        let startView = presenting ? probVC.view! : hexVC.view!
        
        let size = HexButton.size
        
        let initialCenter = CGPoint(x: size.width / 2, y: (size.height / 2) - 20)
        let finalCenter = CGPoint(x: size.width / 2, y: size.height / 2)
        
        let initialFrame = CGRect(x: size.width / 2, y: (size.height / 2) - 20, width: 60, height: 60)
        let finalFrame = CGRect(x: size.width / 2, y: size.height / 2, width: 80, height: 80)
        
        let frame = presenting ? finalFrame : initialFrame
        let center = presenting ? finalCenter : initialCenter
        
        let probAlpha: CGFloat = presenting ? 0 : 1
        let hexAlpha: CGFloat = presenting ? 1 : 0
        
        containerView.addSubview(startView)
        containerView.bringSubviewToFront(startView)
        
        func probAnimation() {
            probVC.contentView.hexes.forEach {
                $0.icon.frame = frame
                $0.icon.center = center
                $0.probability?.alpha = probAlpha
            }
        }
        
        func probButtonAnimation() {
            probVC.contentView.add.alpha = probAlpha
            probVC.contentView.remove.alpha = probAlpha
            probVC.contentView.eraser.alpha = probAlpha
            probVC.header.setAlpha(to: probAlpha)
        }
        
        func addHexAnimation() {
            hexVC.selectHexView.hexes.forEach {
                $0.icon.frame = frame
                $0.icon.center = center
                $0.probability?.alpha = probAlpha
                hexVC.selectHexView.cancelButton.alpha = hexAlpha
                hexVC.header.instructions.alpha = hexAlpha
            }
        }
        
        func hexButtonsAnimation() {
            hexVC.header.instructions.alpha = hexAlpha
            hexVC.selectHexView.cancelButton.alpha = hexAlpha
        }
        
        UIView.animate(withDuration: duration, animations: {
            
            probAnimation()
            addHexAnimation()
            
            if self.presenting {
                probButtonAnimation()
            }else{
                hexButtonsAnimation()
            }
            
        }, completion: { _ in
            
            containerView.addSubview(endView)
            containerView.bringSubviewToFront(endView)
            
            UIView.animate(withDuration: 0.15, animations: {
                if !self.presenting {
                    probButtonAnimation()
                }else{
                    hexButtonsAnimation()
                }
            }, completion: { _ in
                transitionContext.completeTransition(true)
            })
            
            
        })
    }
}




