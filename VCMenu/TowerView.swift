//
//  TowerView.swift
//  VCMenu
//
//  Created by June Kim on 2016-01-18.
//  Copyright © 2016 June Kim. All rights reserved.
//

import UIKit

class TowerView: UIView, PutAware {
    
    enum TowerPosition {
        case Top
        case Bottom
    }

    var position: TowerPosition = .Top
    static let defaultSeparatorColor:UIColor = UIColor.lightGrayColor()
    
    var padding:CGFloat = 20
    var spacing:CGFloat = 0
    var separatorColor:UIColor?
    var separatorShown = true {
        didSet{
            separatorColor = UIColor.clearColor()
        }
    }
    
    private var shownFrame:CGRect?
    private var hiddenFrame:CGRect?
    
    ///configure variables before setting rows
    var rows:[UIView] = [UIView]() {
        didSet{
            towerLayout()
        }
    }
    
    
    func show(toFrame:CGRect? = nil) {
        if let parameterFrame = toFrame {
            animate(to: parameterFrame)
        } else if let localVariableFrame = shownFrame {
            animate(to: localVariableFrame)
        } else {
            assert(false, "provide a frame or make sure the local variable is set!")
        }
    }
    
    func hide(toFrame:CGRect? = nil) {
        if let parameterFrame = toFrame {
            animate(to: parameterFrame)
        } else if let localVariableFrame = hiddenFrame {
            animate(to: localVariableFrame)
        } else {
            assert(false, "provide a frame or make sure the local variable is set!")
        }
    }
    private func towerLayout() {
        var lastView: UIView?
        for eachRow in rows {
            guard let bottomView = lastView else {
                //first view does not have any separators.
                put(eachRow,
                    inside: self,
                    onThe: .Top,
                    withPadding: padding)
                lastView = eachRow
                continue
            }
            let separator = separatorView(bottomView.width)
            put(separator, under: bottomView)
            put(eachRow, under: separator)
            lastView = eachRow
        }
        if let finalView = lastView {
            resize(toWidth: width, toHeight: finalView.maxY + padding)
        }
        addShadow()
    }

    private func configureAnimation() {
        shownFrame = frame
        switch position {
        case .Top: //hidden frame is above the screen
            let offsetY = -minY - height
            if offsetY >= 0 { //HAX
                return
            }
            hiddenFrame =  CGRectOffset(frame, 0, offsetY)
        case .Bottom:
            let offsetY = height + (screenHeight - maxY)
            hiddenFrame =  CGRectOffset(frame, 0, offsetY)
        }
    }
    
    private func put(aView:UIView, under relativeView:UIView ) {
        put(aView,
            atThe: .Bottom,
            of: relativeView,
            withSpacing: spacing/2)
        aView.reposition(toX: relativeView.minX, toY: aView.minY)
    }
    
    private func separatorView(width: CGFloat) -> UIView {
        let newSeparator = UIView(width: width, height: 1)
        newSeparator.userInteractionEnabled = false
        newSeparator.backgroundColor = separatorColor ?? TowerView.defaultSeparatorColor
        return newSeparator
    }
    
    func wasPut() {
        configureAnimation()
    }

}
