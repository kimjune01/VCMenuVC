//
//  KabuniLabel.swift
//  VCMenu
//
//  Created by June Kim on 2016-01-18.
//  Copyright © 2016 June Kim. All rights reserved.
//

import UIKit

class KabuniLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        font = brandFont(.DemiBold, size:16)
        baselineAdjustment = UIBaselineAdjustment.AlignBaselines
        lineBreakMode = NSLineBreakMode.ByTruncatingTail
        autoresizesSubviews = true
        
    }

}
