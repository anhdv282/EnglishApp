//
//  PE_MainQuestion.swift
//  PracticalEnglish
//
//  Created by mac on 10/8/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import Foundation
import RealmSwift

class PE_MainQuestion: Object {
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
    dynamic var id:Int = 0
    dynamic var mainQuestion:String = ""
    let listQuestion = List<PE_Question>()
}
