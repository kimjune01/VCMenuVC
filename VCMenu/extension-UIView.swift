

import UIKit

extension UIView {

    func debugColors() {
        
        func randomColor() -> UIColor {
            func randomCGFloat() -> CGFloat {
                return CGFloat(arc4random()) / CGFloat(UInt32.max)
            }
            let r = randomCGFloat()
            let g = randomCGFloat()
            let b = randomCGFloat()
            
            return UIColor(red: r, green: g, blue: b, alpha: 1.0)
        }
        
        for eachSubview in subviews {
            eachSubview.backgroundColor = randomColor()
        }
    }
    
    
}

extension UIView { //relativeLayout
    
    enum Position {
        case Left
        case Right
        case Top
        case Bottom
        case TopLeft
        case TopRight
        case BottomLeft
        case BottomRight
    }
    
    convenience init(width theWidth:CGFloat, height theHeight: CGFloat) {
        self.init()
        self.frame = CGRectMake(0, 0, theWidth, theHeight)
    }
    
    
    func put(aSubview:UIView, inside thisView:UIView, onThe position:Position, withPadding padding:CGFloat) {
        assert(aSubview.width <= thisView.width &&
            aSubview.height <= thisView.height,
            "The subview is too large to fit inside this view!")
        if position == .Left || position == .Right {
            assert(aSubview.width + 2  * padding < thisView.width,
                "The padding is too wide!")
        }
        if position == .Top || position == .Bottom {
            assert(aSubview.height + 2  * padding < thisView.height,
                "The padding is too high!")
        }
    
        if let aLabel = aSubview as? UILabel { aLabel.sizeToFit() }
        var subRect: CGRect = CGRectZero
        switch position {
        case .Left:
            subRect = CGRectMake(
                padding,
                thisView.midHeight - aSubview.midHeight,
                aSubview.width,
                aSubview.height)
        case .Right:
            subRect = CGRectMake(
                thisView.width - padding - aSubview.width,
                thisView.midHeight - aSubview.midHeight,
                aSubview.width,
                aSubview.height)
        case .Top:
            subRect = CGRectMake(
                thisView.midWidth - aSubview.midWidth,
                padding,
                aSubview.width,
                aSubview.height)
        case .Bottom:
            subRect = CGRectMake(
                thisView.midWidth - aSubview.midWidth,
                thisView.height - padding - aSubview.height,
                aSubview.width,
                aSubview.height)
        case .TopLeft:
            subRect = CGRectMake(
                padding,
                padding,
                aSubview.width,
                aSubview.height)
        case .TopRight:
            subRect = CGRectMake(
                thisView.width - padding - aSubview.width,
                padding,
                aSubview.width,
                aSubview.height)
        case .BottomLeft:
            subRect = CGRectMake(
                padding,
                thisView.height - padding - aSubview.height,
                aSubview.width,
                aSubview.height)
        case .BottomRight:
            subRect = CGRectMake(
                thisView.width - padding - aSubview.width,
                thisView.height - padding - aSubview.height,
                aSubview.width,
                aSubview.height)
            
        }
        aSubview.frame = subRect
        thisView.addSubview(aSubview)
    }
    
    func put (aView:UIView, atThe position:Position, of relativeView:UIView, withSpacing spacing:CGFloat) {
        let diagonalSpacing:CGFloat = spacing / sqrt(2.0)
        switch position {
        case .Left:
            aView.center = CGPointMake(
                relativeView.minX - aView.width/2 - spacing,
                relativeView.midY)
        case .Right:
            aView.center = CGPointMake(
                relativeView.maxX + aView.width/2 + spacing,
                relativeView.midY)
        case .Top:
            aView.center = CGPointMake(
                relativeView.midX,
                relativeView.minY - aView.height/2 - spacing)
        case .Bottom:
            aView.center = CGPointMake(
                relativeView.midX,
                relativeView.maxY + aView.height/2 + spacing)
        case .TopLeft:
            aView.center = CGPointMake(
                relativeView.minX - aView.width/2 - diagonalSpacing,
                relativeView.minY - aView.height/2 - diagonalSpacing)
        case .TopRight:
            aView.center = CGPointMake(
                relativeView.maxX + aView.width/2 + diagonalSpacing,
                relativeView.minY - aView.height/2 - diagonalSpacing)
        case .BottomLeft:
            aView.center = CGPointMake(
                relativeView.minX - aView.width/2 - diagonalSpacing,
                relativeView.maxY + aView.height/2 + diagonalSpacing)
        case .BottomRight:
            aView.center = CGPointMake(
                relativeView.maxX + aView.width/2 + diagonalSpacing,
                relativeView.maxY + aView.height/2 + diagonalSpacing)
            
        }
        if let relativeSuperview =  relativeView.superview {
            relativeSuperview.addSubview(aView)
        }
    }
    
    func resize(toWidth width:CGFloat, toHeight height:CGFloat) {
        frame = CGRectMake(minX, minY, width, height)
    }
    
    func reposition(toX newX:CGFloat, toY newY:CGFloat) {
        frame = CGRectMake(newX, newY, width, height)
    }
    
    func shift(toRight deltaX:CGFloat, toBottom deltaY:CGFloat) {
        frame = CGRectMake(minX + deltaX, minY + deltaY, width, height)
    }

    var width: CGFloat {  return CGRectGetWidth(frame)  }
    var height: CGFloat { return CGRectGetHeight(frame) }
    var minX: CGFloat { return CGRectGetMinX(frame) }
    var minY: CGFloat { return CGRectGetMinY(frame) }
    var midX: CGFloat { return CGRectGetMidX(frame) }
    var midY: CGFloat { return CGRectGetMidY(frame) }
    var midWidth: CGFloat { return CGRectGetWidth(frame)/2 }
    var midHeight: CGFloat { return CGRectGetHeight(frame)/2 }
    var maxX: CGFloat { return CGRectGetMaxX(frame) }
    var maxY: CGFloat { return CGRectGetMaxY(frame) }
    
}

extension UIView {
    
    enum FontStyle: String {
        case Regular = "Regular"
        case DemiBold = "DemiBold"
        case Medium = "Medium"
    }
    
    func animate(to theFrame: CGRect) {
        UIView.animateWithDuration(0.3) {
            self.frame = theFrame
        }
    }
    
    func addShadow() {
        layer.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.2).CGColor
        layer.shadowOffset = CGSizeZero
        layer.shadowOpacity = 1
        layer.shadowRadius = 7
    }
    
    func brandFont(style: FontStyle? = .DemiBold, size:CGFloat? = 16) -> UIFont {
        return UIFont(name: "AvenirNext-" + style!.rawValue, size: size!)!
    }
    
}
