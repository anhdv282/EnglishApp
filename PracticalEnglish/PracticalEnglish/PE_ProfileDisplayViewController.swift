//
//  EA_ProfileDisplayViewController.swift
//  PracticalEnglish
//
//  Created by mac on 10/21/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit

class PE_ProfileDisplayViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewType : PE_ProfileViewType = PE_ProfileViewType.updateProfile
    var arrayTitle : [String] = []
    var arrayIcon : [String] = []
    var arrayString : [String] = ["", "", "", "", "", "", "", ""]
    var currentTag : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "PE_TextFieldTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "PE_TextFieldTableViewCell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func isValidEmail(_ testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    @IBAction func clickTap(_ sender: AnyObject) {
        self.view.endEditing(true)
        self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
}

extension PE_ProfileDisplayViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTag = textField.tag
        self.tableView.scrollToRow(at: IndexPath(row: textField.tag - tagTextField, section: 0), at: .top, animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        arrayString[textField.tag - tagTextField] = textField.text!
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if viewType == PE_ProfileViewType.signUp {
            currentTag = textField.tag + 1
            if textField.tag != tagTextField + arrayTitle.count - 1 {
                for string in arrayString {
                    if string == "" {
                        if self.view.viewWithTag(textField.tag + 1) is UITextField {
                            (self.view.viewWithTag(textField.tag + 1) as! UITextField).becomeFirstResponder()
                            self.tableView.scrollToRow(at: IndexPath(row: textField.tag - tagTextField, section: 0), at: .top, animated: true)
                            return true
                        }
                    }
                }
            }
            self.clickTap(UIButton())
        }
        return true
    }
}
