//
//  ViewController.swift
//  PracticalEnglish
//
//  Created by mac on 9/18/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKShareKit
import FirebaseAuth

class ViewController: BackgroundViewController {
    
    
    var loginButton:FBSDKLoginButton = FBSDKLoginButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        loginButton.delegate = self
//        loginButton.readPermissions = ["public_profile", "email", "user_friends"];
//        loginButton.center = self.view.center
//        self.view.addSubview(loginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBAction func clickOnThiBtn(_ sender: AnyObject) {
        let alert:UIAlertController = UIAlertController.init(title: "Thông báo", message: "Tính năng này sẽ cập nhật sau", preferredStyle: .alert)
        let alertAction:UIAlertAction = UIAlertAction(title: "Bỏ qua", style: .cancel) { (action) in
            
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
        
    }
}

//extension ViewController:FBSDKLoginButtonDelegate {
//    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
//        print("Log in:\(result.token)")
////        let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
////        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
////            // ...
////            print("User log in to firebase app")
////        }
//        if let error = error {
//            print(error.localizedDescription)
//            return
//        }
//    }
//    
//    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
//        print("Log out")
//    }
    
    
//}
