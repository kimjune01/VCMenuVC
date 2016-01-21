//
//  RedVC.swift
//  VCMenu
//
//  Created by June Kim on 2016-01-14.
//  Copyright © 2016 June Kim. All rights reserved.
//

import UIKit

class RedVC: UIViewController {

    let whiteView = UIView(width: 100, height: 100)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.redColor()

        whiteView.backgroundColor = UIColor.whiteColor()
        put(whiteView, inside: view, onThe: .Top, withPadding: navigationBarHeight() + statusBarHeight * 2)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    func animate() {
        let originalFrame = whiteView.frame
        
        let topLeftFrame = CGRectMake(statusBarHeight, navigationBarHeight() + statusBarHeight * 2, whiteView.width, whiteView.height)
        
        let bottomLeftFrame = CGRectMake(statusBarHeight, view.height - whiteView.height - statusBarHeight, whiteView.width, whiteView.height)
        
        let bottomRightFrame = CGRectMake(view.width - statusBarHeight - whiteView.width,  view.height - whiteView.height - statusBarHeight, whiteView.width, whiteView.height)
        
        let topRightFrame = CGRectMake(view.width - statusBarHeight - whiteView.height, navigationBarHeight() + statusBarHeight * 2, whiteView.width, whiteView.height)
        
        whiteView.animate( to: topLeftFrame){
            self.whiteView.animate(to: bottomLeftFrame){
                self.whiteView.animate(to: bottomRightFrame){
                    self.whiteView.animate(to: topRightFrame){
                        self.whiteView.animate(to: originalFrame)
                    }
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
