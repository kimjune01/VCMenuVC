//
//  YellowVC.swift
//  VCMenu
//
//  Created by June Kim on 2016-01-14.
//  Copyright © 2016 June Kim. All rights reserved.
//

import UIKit

class YellowVC: UIViewController {
    
    var realmText = RealmText()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellowColor()

        let textField = UITextField(width: screenWidth, height: 44)
        textField.delegate = self
        textField.backgroundColor = UIColor.lightGrayColor()
        textField.addTarget(self, action: "textFieldDidchange:", forControlEvents: .EditingChanged)
        view.put(textField, inside: view, onThe: .Bottom, withPadding: 44)
        
        
    }
    
    func textFieldDidchange(textField: UITextField) {
        print(textField.text)
        save(textField.text!)
    }
    
    func save(text:String) {
        realmText.someText = text
        
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

extension YellowVC: UITextFieldDelegate {
    
}











