//
//  FoldoutCollectionViewCell.swift
//  VCMenu
//
//  Created by June Kim on 2016-01-21.
//  Copyright © 2016 June Kim. All rights reserved.
//

import UIKit

class FoldoutCollectionViewCell: UICollectionViewCell {
    var product:Product!{
        didSet{
            setup()
        }
    }
    
    var photoView:UIImageView!
    var label:UILabel!
    var priceTag: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(){
        photoView = UIImageView(image: imageFromUrl(product.imageSource))
        photoView.resize(toWidth: width - 30, toHeight: width - 30)
        put(photoView, inside: self, onThe: .Top, withPadding: 4)
        
        label = productLabel(product.name)
        put(label, inside: self, onThe: .Bottom, withPadding: 40)

        priceTag = productLabel("$" + String(product.price))
        put(priceTag, inside: self, onThe: .Bottom, withPadding: 20)
    }
    
    func productLabel(text:String) -> UILabel {
        let label = UILabel(width: width, height: height/7)
        label.textAlignment = .Center
        label.font = brandFont(.Medium, size: 14)
        label.textColor = UIColor.darkGrayColor()
        label.text = text
        label.sizeToFit()
        return label
    }
    
    
    
}
