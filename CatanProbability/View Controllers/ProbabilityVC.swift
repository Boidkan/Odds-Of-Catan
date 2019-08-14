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
        self.present(vc, animated: true, completion: nil)
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
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }

}
