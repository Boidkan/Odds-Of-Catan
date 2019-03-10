//
//  ViewController.swift
//  CatanProbability
//
//  Created by Eric Collom on 2/15/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class ProbabilityVC: UIViewController {
    
    var probabilityViewModel = ProbabilityViewModel()
    var contentView = ProbabilityView()
    var header = ProbabilityHeaderView()
    
    let transition = HexIconsAnimator()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        
        transition.dismissCompletion = {
            UIView.animate(withDuration: 0.15) {
                self.contentView.add.alpha = 1
                self.contentView.remove.alpha = 1
                self.contentView.eraser.alpha = 1
                self.header.setAlpha(to: 1)
            }
        }
        
        probabilityViewModel.configure(view: header)
        probabilityViewModel.configure(view: contentView)
        
        contentView.add.addTarget(self, action: #selector(addHex), for: .touchUpInside)
        contentView.eraser.addTarget(self, action: #selector(clear), for: .touchUpInside)
        
        self.view.addSubview(header)
        self.view.addSubview(contentView)
        
    }
    
    @objc func addHex() {
        let vc = AddHexVC()
        vc.transitioningDelegate = self
        UIView.animate(withDuration: 0.15, animations: {
            self.contentView.add.alpha = 0
            self.contentView.remove.alpha = 0
            self.contentView.eraser.alpha = 0
            self.header.setAlpha(to: 0)
        }, completion: { _ in
            self.present(vc, animated: true, completion: nil)
        })
        
    }
    
    func add(hex: Hex) {
        probabilityViewModel.add(hex: hex)
        probabilityViewModel.configure(view: contentView)
        probabilityViewModel.configure(view: header)
    }
    
    @objc func clear() {
        probabilityViewModel.clear()
        probabilityViewModel.configure(view: contentView)
        probabilityViewModel.configure(view: header)
    }
}

extension ProbabilityVC: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = false
        return transition
    }

}
