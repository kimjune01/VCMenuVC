//
//  TowerView.swift
//  VCMenu
//
//  Created by June Kim on 2016-01-18.
//  Copyright © 2016 June Kim. All rights reserved.
//

import UIKit

///sorta like stackview, but simpler and for ios 8+
class TowerView: UIView {
    
    static let defaultPadding:CGFloat = 20
    static let defaultSpacing:CGFloat = 10
    static let defaultSeparatorColor:UIColor = UIColor.lightGrayColor()
    
    var padding:CGFloat?
    var spacing:CGFloat?
    var separatorColor:UIColor?
    var separatorShown = true {
        didSet{
            separatorColor = UIColor.clearColor()
        }
    }
    
    var rows:[UIView] = [UIView]() {
        didSet{
            towerLayout()
        }
    }
    
    func towerLayout() {
        var lastView: UIView?
        let layoutPadding = padding ?? TowerView.defaultPadding
        for eachRow in rows {
            guard let bottomView = lastView else {
                put(eachRow,
                    inside: self,
                    onThe: .TopLeft,
                    withPadding: layoutPadding)
                lastView = eachRow
                continue
            }
            let separator = separatorView()
            put(separator, under: bottomView)
            put(eachRow, under: separator)
            lastView = eachRow
        }
    }
    
    func put(aView:UIView, under relativeView:UIView ) {
        let layoutSpacing = spacing ?? TowerView.defaultSpacing
        put(aView,
            atThe: .Bottom,
            of: relativeView,
            withSpacing: layoutSpacing/2)
        aView.reposition(toX: relativeView.minX, toY: aView.minY)
    }
    
    func separatorView() -> UIView {
        let layoutPadding = padding ?? TowerView.defaultPadding
        let newSeparator = UIView(width: width - layoutPadding, height: 1)
        newSeparator.userInteractionEnabled = false
        newSeparator.backgroundColor = separatorColor ?? TowerView.defaultSeparatorColor
        return newSeparator
    }

}
