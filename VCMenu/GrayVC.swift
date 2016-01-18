//
//  WhiteVC.swift
//  VCMenu
//
//  Created by June Kim on 2016-01-15.
//  Copyright © 2016 June Kim. All rights reserved.
//

import UIKit

class GrayVC: UIViewController {
    
    let addImagesView = AddImagesView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.grayColor()
        view.addSubview(addImagesView)
        addImagesView.animate(to: AddImagesView.shownFrame)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        addImagesView.animate(to: AddImagesView.shownFrame)
    }
        
    override func viewWillDisappear(animated: Bool) {
        addImagesView.animate(to: AddImagesView.hiddenFrame)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
