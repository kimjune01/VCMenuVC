//
//  ClearVC.swift
//  VCMenu
//
//  Created by June Kim on 2016-01-15.
//  Copyright © 2016 June Kim. All rights reserved.
//

import UIKit

class ClearVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let middleView = UIView(width: 100, height: 100)
        middleView.backgroundColor = UIColor.blueColor()
        view.put(middleView,
            inside: view,
            onThe: .BottomLeft,
            withPadding: 10)
        
        let someOtherView = UIView(width: 50, height: 50)
        someOtherView.backgroundColor = UIColor.greenColor()
        view.put(someOtherView,
            atThe: .TopRight,
            of: middleView,
            withSpacing: 20)
        
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
