//
//  WideButton.swift
//  VCMenu
//
//  Created by June Kim on 2016-01-19.
//  Copyright © 2016 June Kim. All rights reserved.
//

import UIKit

class WideButton: UIButton {
    
    private static let width = screenWidth * 0.7
    private static let height = screenWidth * 0.165
    private static let padding = WideButton.width * 0.07
    private static let estimatedIconWidth:CGFloat = 44
    
    var buttonText:String
    var imageIcon:UIImage?
    
    private var label:UILabel!
    private var icon:UIImageView!
    
    
    init(buttonText text: String, icon:UIImage?){
        self.buttonText = text
        self.imageIcon = icon?.imageWithRenderingMode(.AlwaysTemplate)
        super.init(frame: CGRectMake(0, 0, WideButton.width, WideButton.height))
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        self.buttonText = ""
        self.imageIcon = UIImage()
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        tintColor = UIColor.redColor()
        backgroundColor = UIColor.whiteColor()
        self.label = buttonLabel(self.buttonText)
        put(self.label,
            inside: self,
            onThe: .Left,
            withPadding: WideButton.padding)
        self.icon = buttonIconView(self.imageIcon)
        put(self.icon,
            inside: self,
            onThe: .Right,
            withPadding: WideButton.padding)
        self.icon.shift(
            toRight: self.icon.width/2 - WideButton.estimatedIconWidth/2,
            toBottom: 0)
        
        addTarget(self,
            action: "didTouchDown",
            forControlEvents: .TouchDown)
        addTarget(self,
            action: "didTouchDragExit",
            forControlEvents: .TouchDragExit)
        addTarget(self,
            action: "didTouchUpInside",
            forControlEvents: .TouchUpInside)
    }
    
    func didTouchDown() {
        tint()
    }
    func didTouchDragExit() {
        untint()
    }
    func didTouchUpInside() {
        tint()
    }
    
    func tint() {
        
    }
    
    func untint() {
        
    }
    
    func buttonLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = brandFont()
        label.textColor = UIColor.darkGrayColor()
        label.sizeToFit()
        return label
    }
    
    func buttonIconView(image: UIImage?) -> UIImageView {
        let iconView = UIImageView(image: image)
        //TODO: make tintable.
        
        return iconView
    }
    
}
