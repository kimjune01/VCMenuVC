//
//  VCMenuVC.swift
//  Whole New Home
//
//  Created by June Kim on 2016-01-14.
//  Copyright © 2016 Kabuni. All rights reserved.
//

import UIKit

class VCMenuWrapperVC: UIViewController {
    
    var childNavVC = UINavigationController()
    let menuVc = VCMenuVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildVC(childNavVC)
        
        childNavVC.pushViewController(menuVc, animated: false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
