//
//  BlueViewController.swift
//  VCMenu
//
//  Created by June Kim on 2016-01-14.
//  Copyright © 2016 June Kim. All rights reserved.
//

import UIKit

class WhiteVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        let tower = TowerView(width: view.width, height: view.height*0.7)
        view.put(tower,
            inside: view,
            onThe: .Top,
            withPadding: navBarHeight() + statusBarHeight)
        
        tower.rows = [
            firstLabel(),
            firstButton(),
            firstLabel(),
            firstLabel(),
            firstLabel(),
            
        ]
        
        let someYellowView = UIView(width: 150, height: 44)
        someYellowView.backgroundColor = UIColor.yellowColor()
        view.put(someYellowView, atThe: .Bottom, of: tower, withSpacing: 25)
        
    }
    
    func firstLabel() -> UILabel {
        let label = KabuniLabel(width: 50, height: 50)
        label.text = "First Label"
        label.sizeToFit()
        return label
    }
    
    func firstButton() -> UIButton {
        let button = UIButton(width: 90, height: 44)
        button.setTitle("Done", forState: .Normal)
        button.backgroundColor = UIColor.redColor()
        return button
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
