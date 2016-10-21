//
//  Global.swift
//  PracticalEnglish
//
//  Created by mac on 9/26/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit
let textColor = "#134A8D"
let mauChinh = "699F38"

let colorWrong = UIColor(netHex: 0xFF2D55)
let colorRight = UIColor(netHex: 0x699F38)
let colorSelectCollection = UIColor(netHex: 0x2B2B2B)
let colorGray = UIColor(netHex: 0xC7C7CC)

enum QuestionType: Int {
    case notSelected = 0
    case rightQuestion
    case wrongQuestion
}
class Global: NSObject {
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

enum PE_ProfileViewType : Int {
    case updateProfile = 0, changePass, signUp
}

func showAlertView(_ viewController : UIViewController, title : String, message : String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    viewController.present(alert, animated: true, completion: nil)
}
