//
//  User.swift
//  PracticalEnglish
//
//  Created by mac on 10/17/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit

class User: NSObject {
    var name : String
    var mobileNumber : String
    var email : String
    
    init(_name: String, _mobileNumber: String, _email: String) {
        self.name = _name
        self.mobileNumber = _mobileNumber
        self.email = _email
    }
    
    convenience override init() {
        self.init(_name: "", _mobileNumber: "", _email: "")
    }
    
    func toAnyObject() -> Any {
        return [
            "Email": email,
            "Name": name,
            "MobileNUmber": mobileNumber
        ]
    }
}
