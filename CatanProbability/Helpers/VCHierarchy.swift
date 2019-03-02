//
//  VCHierarchy.swift
//  CatanProbability
//
//  Created by Eric Collom on 3/1/19.
//  Copyright © 2019 Eric Collom. All rights reserved.
//

import UIKit

class VCHierarchy {
    class func topMostContoller() -> UIViewController? {
        
        if !Thread.current.isMainThread{
            print("ACCESSING TOP MOST CONTROLLER OUTSIDE OF MAIN THREAD")
            return nil
        }
        
        let topMostVC = UIApplication.shared.keyWindow!.rootViewController!
        return topVCWithRootVC(topMostVC)
    }
    
    /**This method goes through the hierarchy of the view controllers starting at the rootViewController until it reaches the top.*/
    class func topVCWithRootVC(_ rootVC:UIViewController) -> UIViewController? {
        if rootVC is UITabBarController{
            let tabBarController:UITabBarController = rootVC as! UITabBarController
            if let selectVC = tabBarController.selectedViewController{
                return topVCWithRootVC(selectVC)
            }else{
                return nil
            }
        }else if rootVC.presentedViewController != nil{
            
            guard let presentedViewController = rootVC.presentedViewController else { return nil }
            return topVCWithRootVC(presentedViewController)
        } else {
            return rootVC
        }
    }
}
