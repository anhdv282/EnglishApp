//
//  LoginViewController.swift
//  PracticalEnglish
//
//  Created by mac on 9/30/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var emailSignUp: UITextField!
    @IBOutlet weak var passwordSignUp: UITextField!
    @IBOutlet weak var retypePasswordSignUp: UITextField!
    @IBOutlet weak var nameSignUp: UITextField!
    @IBOutlet weak var phoneSignUp: UITextField!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FIRAuth.auth()!.addStateDidChangeListener() { auth, user in
            if user != nil {
                //                self.performSegue(withIdentifier: self.loginToList, sender: nil)
                print("yeah")
            }
            print("auth : \(auth)")
        }
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        // Do any additional setup after loading the view.
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickSignInBtn(_ sender: AnyObject) {
        FIRAuth.auth()!.signIn(withEmail: txtUsername.text!,
                               password: txtPassword.text!)
    }
    
    @IBAction func clickSignUpBtn(_ sender: AnyObject) {
        self.mainView.isHidden = false
    }
    
    @IBAction func clickSignUp(_ sender: UIButton) {
        saveUserToData()
        FIRAuth.auth()!.createUser(withEmail: emailSignUp.text!,
                                   password: passwordSignUp.text!) { user, error in
                                    if error == nil {
                                        FIRAuth.auth()!.signIn(withEmail: self.emailSignUp.text!,
                                                               password: self.passwordSignUp.text!)
                                    } else {
                                        print(error?.localizedDescription)
                                    }
        }
    }
    
    @IBAction func clickCancel(_ sender: AnyObject) {
        self.mainView.isHidden = true
    }
    
    func saveUserToData() {
        let usersRef = FIRDatabase.database().reference(withPath: "User")
        let user :User = User(_name: nameSignUp.text!, _mobileNumber: phoneSignUp.text!, _email: emailSignUp.text!)
        usersRef.setValue(user.toAnyObject())
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtUsername {
            txtPassword.becomeFirstResponder()
        }
        if textField == txtPassword {
            textField.resignFirstResponder()
            self.view.endEditing(true)
        }
        if textField == emailSignUp {
            passwordSignUp.becomeFirstResponder()
        }
        if textField == passwordSignUp {
            retypePasswordSignUp.becomeFirstResponder()
        }
        if textField == retypePasswordSignUp {
            nameSignUp.becomeFirstResponder()
        }
        if textField == nameSignUp {
            phoneSignUp.becomeFirstResponder()
        }
        if textField == phoneSignUp {
            textField.resignFirstResponder()
            self.view.endEditing(true)
            self.clickSignUp(btnSignUp)
        }
        
        return true
    }
    
}
