//
//  CommonTableViewCell.swift
//  PracticalEnglish
//
//  Created by mac on 9/28/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit

class CommonTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
