//
//  MenuQuestionTableViewCell.swift
//  PracticalEnglish
//
//  Created by mac on 9/30/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit

class MenuQuestionTableViewCell: UITableViewCell {
    @IBOutlet weak var headerTitle: UIView!

    @IBOutlet weak var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.headerTitle.layer.borderWidth = 1.0
        self.headerTitle.layer.borderColor = UIColor.clear.cgColor
        self.headerTitle.layer.cornerRadius = 8.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
