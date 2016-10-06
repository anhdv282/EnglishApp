//
//  PlayCollectionViewCell.swift
//  PracticalEnglish
//
//  Created by mac on 9/24/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit

class PlayCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var borderBgView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.borderBgView.layer.borderWidth = 1.0
//        self.borderBgView.layer.borderColor = UIColor.clear.cgColor
        self.borderBgView.layer.cornerRadius = 5.0
        // Initialization code
    }

}
