//
//  FirstTableViewCell.swift
//  wakaka
//
//  Created by apple on 16/12/15.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var testLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
