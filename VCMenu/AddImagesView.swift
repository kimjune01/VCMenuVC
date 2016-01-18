
//
//  AddImagesView.swift
//  Whole New Home
//
//  Created by Ievgen Rudenko on 14.07.15.
//  Copyright (c) 2015 Whole New Home. All rights reserved.
//

import Foundation
import UIKit

protocol AddImagesViewDelegate: class {
    func addPhotosAction(sender: AddImagesView)
    func addFromWebAction(sender: AddImagesView)
}

class AddImagesView: UIView {
    
    weak var delegate: AddImagesViewDelegate?
    
    private static let width = screenWidth * 0.7
    private static let height = screenWidth * 0.35
    private static let margin = AddImagesView.width * 0.1
    
    static let hiddenFrame =
    CGRectMake(
        (screenWidth - AddImagesView.width)/2,
        screenHeight,
        AddImagesView.width,
        AddImagesView.height)
    static let shownFrame =
    CGRectOffset(
        hiddenFrame,
        0,
        -screenHeight * 0.3)
    
    private var addPhotosButton: UIButton!
    private var separator: UIView!
    private var addFromWebButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        if frame == CGRectZero {
            frame = AddImagesView.hiddenFrame
        }
        makePhotosButton()
        makeSeparator()
        makeWebButton()
        addShadow()
    }

    func makePhotosButton() {
        addPhotosButton = UIButton(width: frame.width, height: frame.height/2)
        addPhotosButton.backgroundColor = UIColor.whiteColor()
        addPhotosButton.addTarget(self, action: "photosButtonTapped", forControlEvents: .TouchUpInside)
        addSubview(addPhotosButton)
        
        let cameraIconView = UIImageView(image: UIImage(named: "addPhotosIcon"))
        put(cameraIconView,
            inside: addPhotosButton,
            onThe: .Right,
            withPadding: AddImagesView.margin)
        
        let photosLabel = UILabel()
        photosLabel.text = "Photos"
        photosLabel.textColor = UIColor.darkGrayColor()
        put(photosLabel,
            inside: addPhotosButton,
            onThe: .Left,
            withPadding: AddImagesView.margin)
    }
    func makeSeparator() {
        separator = UIView(width: frame.width, height: 1)
        separator.backgroundColor = UIColor.lightGrayColor()
        put(separator, atThe: .Bottom, of: addPhotosButton, withSpacing: 0)
        
    }
    func makeWebButton() {
        addFromWebButton = UIButton(width: frame.width, height: frame.height/2)
        addFromWebButton.backgroundColor = UIColor.whiteColor()
        addFromWebButton.addTarget(self, action: "webButtonTapped", forControlEvents: .TouchUpInside)
        put(addFromWebButton, atThe: .Bottom, of: separator, withSpacing: 0)
        
        let webIconView = UIImageView(image: UIImage(named: "addFromWebIcon"))
        put(webIconView,
            inside: addFromWebButton,
            onThe: .Right,
            withPadding: AddImagesView.margin)
        
        let webLabel = UILabel()
        webLabel.text = "From Web"
        webLabel.textColor = UIColor.darkGrayColor()
        put(webLabel,
            inside: addFromWebButton,
            onThe: .Left,
            withPadding: AddImagesView.margin)
    }
    
    
    func photosButtonTapped() {
        delegate?.addPhotosAction(self)
        animate(to: AddImagesView.hiddenFrame)
    }
    
    func webButtonTapped() {
        delegate?.addFromWebAction(self)
        animate(to: AddImagesView.hiddenFrame)
    }
    
    func addPhotosAction(sender: AnyObject) {
        delegate?.addPhotosAction(self)
    }
    func addFromWebAction(sender: AnyObject) {
        delegate?.addFromWebAction(self)
    }
    
}