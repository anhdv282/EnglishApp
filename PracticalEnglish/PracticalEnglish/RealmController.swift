//
//  RealmController.swift
//  PracticalEnglish
//
//  Created by mac on 10/7/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit
import RealmSwift
class RealmController: NSObject {

}

func saveData(question:PE_Question) {
    // Get the default Realm
    let realm = try! Realm()
    // You only need to do this once (per thread)
    
    // Add to the Realm inside a transaction
    try! realm.write {
        realm.add(question)
    }
}
