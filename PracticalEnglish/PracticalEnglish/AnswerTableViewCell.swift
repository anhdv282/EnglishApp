//
//  AnswerTableViewCell.swift
//  PracticalEnglish
//
//  Created by mac on 9/25/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var borderView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.borderView.layer.borderWidth = 1.0
        self.borderView.layer.borderColor = UIColor(netHex: 0x699F38).cgColor
        self.borderView.layer.cornerRadius = 5.0
        // Initialization code
    }
    //http://stackoverflow.com/questions/6216839/how-to-add-spacing-between-uitableviewcell
    
    func setModel() {
        self.borderView.backgroundColor = UIColor.white
        self.borderView.clipsToBounds = true
    }
    
}
