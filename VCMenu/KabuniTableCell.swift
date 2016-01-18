//
//  KabuniTableCell.swift
//  VCMenu
//
//  Created by June Kim on 2016-01-18.
//  Copyright © 2016 June Kim. All rights reserved.
//

import UIKit

class KabuniTableCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        guard let label = textLabel else {
            return
        }
        label.font = brandFont()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
