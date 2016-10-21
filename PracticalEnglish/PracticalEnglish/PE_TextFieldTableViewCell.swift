//
//  PE_TextFieldTableViewCell.swift
//  PracticalEnglish
//
//  Created by mac on 10/21/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit

protocol PE_TextFieldTableViewCellDelegate {
    func clickCell()
}

class PE_TextFieldTableViewCell: UITableViewCell {
    @IBOutlet weak var imageIcon: UIImageView!

    @IBOutlet weak var viewSplit: UIView!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var btHidden: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var delegate : PE_TextFieldTableViewCellDelegate!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func clickCell(_ sender: AnyObject) {
        if self.delegate != nil {
            self.delegate.clickCell()
        }
    }
}
