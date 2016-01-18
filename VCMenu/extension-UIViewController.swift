//
//  ViewControllerExtension.swift
//  VCMenu
//
//  Created by June Kim on 2016-01-14.
//  Copyright © 2016 June Kim. All rights reserved.
//

import UIKit


let screenWidth = UIScreen.mainScreen().bounds.width
let screenHeight = UIScreen.mainScreen().bounds.height
let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height

extension UIViewController {
    func addChildVC(vc: UIViewController) {
        addChildViewController(vc)
        view.addSubview(vc.view)
        vc.didMoveToParentViewController(vc)
    }
    func name() -> String {
        return  NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last!
    }
    func navBarHeight() -> CGFloat {
        if let navController = navigationController {
            return navController.navigationBar.height
        } else {
            return 0
        }
    }
}
