//
//  FoldoutCollectionFolderView.swift
//  VCMenu
//
//  Created by June Kim on 2016-01-21.
//  Copyright © 2016 June Kim. All rights reserved.
//

import UIKit

protocol FoldoutCollectionFolderViewDelegate {
    func folderViewDidSelect(folder:FoldoutCollectionFolderView, product:Product)
}


class FoldoutCollectionFolderView: UICollectionReusableView {
    
    var leftProduct:Product! = Product()
    var rightProduct:Product! = Product()
    
    var leftProductCell: FoldoutCollectionViewCell!
    var rightProductCell: FoldoutCollectionViewCell!
    
    var expanded:Bool = false {
        willSet {
            if expanded {
                shrink()
            } else {
                expand()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        addThinShadow()
        addProductCells()
        clipsToBounds = true
    }
    
    func addProductCells() {
        leftProductCell = FoldoutCollectionViewCell(width: width/2 - 10, height: height - 10)
        leftProductCell.product = leftProduct
        put(leftProductCell, inside: self, onThe: .Left, withPadding: 5)
        rightProductCell = FoldoutCollectionViewCell(width: width/2 - 10, height: height - 10)
        rightProductCell.product = rightProduct
        put(rightProductCell, inside: self, onThe: .Right, withPadding: 5)
        
    }
    
    private func shrink() {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.leftProductCell.shift(toRight: 0, toBottom: -self.leftProductCell.height)
            self.rightProductCell.shift(toRight: 0, toBottom: -self.rightProductCell.height)
            }) { (finished:Bool) -> Void in
                self.leftProductCell.shift(toRight: 0, toBottom: self.leftProductCell.height)
                self.rightProductCell.shift(toRight: 0, toBottom: self.rightProductCell.height)
        }
    }
    
    private func expand() {
        self.leftProductCell.shift(toRight: 0, toBottom: -self.leftProductCell.height)
        self.rightProductCell.shift(toRight: 0, toBottom: -self.rightProductCell.height)
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.leftProductCell.shift(toRight: 0, toBottom: self.leftProductCell.height)
            self.rightProductCell.shift(toRight: 0, toBottom: self.rightProductCell.height)
            }) { (finished:Bool) -> Void in
                
        }
    }
}
