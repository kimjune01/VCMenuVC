//
//  GreenVC.swift
//  VCMenu
//
//  Created by June Kim on 2016-01-14.
//  Copyright © 2016 June Kim. All rights reserved.
//

import UIKit

class GreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.greenColor()
        let tower = TowerView(width: screenWidth * 0.85, height: screenHeight * 0.7)
        view.put(tower,
            inside: view,
            onThe: .Top,
            withPadding: navBarHeight() + statusBarHeight)
        
        tower.rows = [
            bathroomButton(),
            bedroomButton(),
            bathroomButton(),
            bathroomButton(),
            bedroomButton(),
            bathroomButton(),
            bathroomButton(),
            bedroomButton(),
            bathroomButton()
        ]
        
        
    }
    
    func bathroomButton() -> UIButton {
        let button = WideButton(buttonText: "Bathroom", icon: UIImage(named: "bathroom"))
        button.addTarget(self, action: "bathroomButtonTapped", forControlEvents: .TouchUpInside)
        return button
    }
    
    func bedroomButton() -> UIButton {
        let button = WideButton(buttonText: "Bedroom", icon: UIImage(named: "bedroom"))
        button.addTarget(self, action: "bedroomButtonTapped", forControlEvents: .TouchUpInside)
        return button
    }
    
    func bathroomButtonTapped() {
        print("bathroomButtonTapped()")
    }

    func bedroomButtonTapped() {
        print("bedroomButtonTapped()")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
