//
//  PE_LoginViewController.swift
//  PracticalEnglish
//
//  Created by mac on 10/20/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit
import Firebase
let tagTextField = 100
class PE_LoginViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var consBotLoginView: NSLayoutConstraint!
    var textEmail : String = ""
    var textPassword : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "PE_TextFieldTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "PE_TextFieldTableViewCell")
        NotificationCenter.default.addObserver(self, selector: #selector(PE_LoginViewController.keyboardShown(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(PE_LoginViewController.keyboardHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        FIRAuth.auth()!.addStateDidChangeListener() { auth, user in
            if user != nil {
                //                self.performSegue(withIdentifier: self.loginToList, sender: nil)
                print("yeah")
            }
            print("auth : \(auth)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: keyboard
    func keyboardShown(_ notification: Notification) {
        let info  = (notification as NSNotification).userInfo!
        let value: AnyObject = info[UIKeyboardFrameEndUserInfoKey]! as AnyObject
        
        let rawFrame = value.cgRectValue
        let keyboardFrame = view.convert(rawFrame!, from: nil)
        if self.view.frame.height > 480 {
            self.consBotLoginView.constant = keyboardFrame.height - 15
        }
        else {
            self.consBotLoginView.constant = keyboardFrame.height - 65
        }
        self.view.layoutIfNeeded()
    }
    
    func keyboardHide(_ notification: Notification) {
        self.consBotLoginView.constant = 0
        self.view.layoutIfNeeded()
    }
   
    @IBAction func clickHideKeyboard(_ sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    @IBAction func clickSignIn(_ sender: UIButton) {
        if textPassword != "" || textEmail != "" {
            FIRAuth.auth()!.signIn(withEmail: textEmail,
                                   password: textPassword)
        } else {
            // Create the alert controller
            let alertController = UIAlertController(title: "Lỗi", message: "Email và mật khẩu không để rỗng", preferredStyle: .alert)
            
            // Create the actions
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
                UIAlertAction in
            }
            
            // Add the actions
            alertController.addAction(cancelAction)
            
            // Present the controller
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func clickSignUp(_ sender: UIButton) {
        
    }
    
    @IBAction func clickForgotPass(_ sender: UIButton) {
    }
    
    
}

extension PE_LoginViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PE_TextFieldTableViewCell", for: indexPath) as! PE_TextFieldTableViewCell
        cell.textField.delegate = self
        cell.textField.tag = tagTextField + (indexPath as NSIndexPath).row
        
        if (indexPath as NSIndexPath).row == 0 {
            cell.textField.attributedPlaceholder = NSAttributedString(string:"Email", attributes:[NSForegroundColorAttributeName: UIColor.gray])
            cell.imageIcon.image = UIImage(named: "img_user_sign_in")
            cell.textField.returnKeyType = .next
        }
        else {
            cell.textField.attributedPlaceholder = NSAttributedString(string:"Mật khẩu", attributes:[NSForegroundColorAttributeName: UIColor.gray])
            cell.textField.isSecureTextEntry = true
            cell.imageIcon.image = UIImage(named: "img_password_sign_in")
            cell.textField.returnKeyType = .done
        }
        return cell
    }
}

extension PE_LoginViewController : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == tagTextField {
            textEmail = textField.text!
        }
        if textField.tag == tagTextField + 1 {
            textPassword = textField.text!
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == tagTextField {
            if self.view.viewWithTag(tagTextField + 1) is UITextField {
                (self.view.viewWithTag(tagTextField + 1) as! UITextField).becomeFirstResponder()
            }
        }
        else if textField.tag == tagTextField + 1 {
            textField.resignFirstResponder()
            self.clickSignIn(UIButton())
        }
        return true
    }
}
