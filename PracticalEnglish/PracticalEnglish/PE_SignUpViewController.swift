//
//  PE_SignUpViewController.swift
//  PracticalEnglish
//
//  Created by mac on 10/21/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit

class PE_SignUpViewController: PE_ProfileDisplayViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewType = PE_ProfileViewType.signUp
        arrayTitle = ["Họ tên", "Email", "Mật khẩu", "Xác nhận mật khẩu", "Số điện thoại"]
        arrayIcon = ["", "", "", "", "",]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickBackBtn(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickSignUp(_ sender: UIButton) {
        super.clickTap(sender)
        for string in arrayString {
            if string == "" {
                showAlertView(self, title: "", message: "Hãy điền thông tin còn thiếu")
                return;
            }
        }
        //check email
        if !isValidEmail(arrayString[1]) {
            showAlertView(self, title: "", message: "Địa chỉ email không hợp lệ")
            return;
        }
        if arrayString[0] == arrayString[1] {
            showAlertView(self, title: "", message: "Địa chỉ email trùng với tên")
            return;
        }
        //check pass
        if arrayString[2] != arrayString[3] {
            showAlertView(self, title: "", message: "Mật khẩu không trùng nhau")
            return;
        }
        if arrayString[1] == arrayString[2] {
            showAlertView(self, title: "", message: "Mật khẩu không trùng email")
            return;
        }
        if arrayString[2] == arrayString[0] {
            showAlertView(self, title: "Message", message: "Mật khẩu không được trùng tên")
            return;
        }
        //sign up code here
    }

}

extension PE_SignUpViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if UIScreen.main.bounds.height == 480 {
            return arrayTitle.count + 3
        }
        else {
            return arrayTitle.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PE_TextFieldTableViewCell", for: indexPath) as! PE_TextFieldTableViewCell
        if (indexPath as NSIndexPath).row < arrayTitle.count {
            cell.contentView.isHidden = false
            cell.textField.delegate = self
            cell.textField.tag = tagTextField + (indexPath as NSIndexPath).row
            
            cell.textField.textColor = UIColor.black
            cell.textField.text = arrayString[(indexPath as NSIndexPath).row]
            cell.textField.attributedPlaceholder = NSAttributedString(string:arrayTitle[(indexPath as NSIndexPath).row], attributes:[NSForegroundColorAttributeName: UIColor.gray])
            cell.imageIcon.image = UIImage(named: arrayIcon[(indexPath as NSIndexPath).row])
            
            cell.textField.isSecureTextEntry = arrayTitle[(indexPath as NSIndexPath).row].contains("Mật khẩu")
            if (indexPath as NSIndexPath).row != arrayTitle.count - 1 {
                cell.textField.returnKeyType = .next
            }
            else {
                cell.textField.inputView = nil
                cell.textField.inputAccessoryView = nil
            }
        }
        else {
            cell.contentView.isHidden = true
        }
        return cell
    }
}

extension PE_SignUpViewController {
    override func textFieldDidEndEditing(_ textField: UITextField) {
        super.textFieldDidEndEditing(textField)
//        if textField.tag - tagTextField == 5 {
//            if arrayString[4] != arrayString[5] && arrayString[4] != "" {
//                showAlertView(self, title: "Message", message: "Password is not match")
//                return;
//            }
//        }
    }
}
