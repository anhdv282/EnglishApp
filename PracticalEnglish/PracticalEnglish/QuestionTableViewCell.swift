//
//  QuestionTableViewCell.swift
//  PracticalEnglish
//
//  Created by mac on 9/30/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    @IBOutlet weak var questionContent: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
