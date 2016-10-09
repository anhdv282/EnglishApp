//
//  SplashScreenViewController.swift
//  PracticalEnglish
//
//  Created by mac on 9/30/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit
import MBProgressHUD
import Firebase
class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func getData(dataName:String) {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        let rootRef = FIRDatabase.database().reference().child(dataName)
        rootRef.observe(.value, with: { (snapshot) in
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                var i = 0
                for snap in snapshots {
                    i += 1
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        let grammar:MainQuestion = MainQuestion()
                        var questions:[Question] = [Question]()
                        grammar.mainQuestion = postDict["Content"] as! String
                        let listQ = postDict["ListQuestion"] as? [[String : AnyObject]]
                        for q in listQ! {
                            let question:Question = Question()
                            if let a = q["Question"] as? String {
                                question.Question = a
                            }
                            if let a = q["Answer0"] as? String {
                                question.Answer0 = a
                            }
                            if let a = q["Answer1"] as? String {
                                question.Answer1 = a
                            }
                            if let a = q["Answer2"] as? String {
                                question.Answer2 = a
                            }
                            if let a = q["Answer3"] as? String {
                                question.Answer3 = a
                            }
                            if let a = q["IsCorrect"] as? NSNumber {
                                let aString = a.intValue
                                question.IsCorrect = aString
                            }
                            if let a = q["Id"] as? NSNumber {
                                let aString = a.intValue
                                question.iD = aString
                            }
                            //                            question.iD = q["Id"] as! String
                            questions.append(question)
                        }
                        grammar.listQuestion = questions
                        grammar.id = i
//                        self.listMainQuestion.append(grammar)
                    }
                }
                //
                MBProgressHUD.hide(for: self.view, animated: true)
            } else {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
            
        }) { (error) in
            MBProgressHUD.hide(for: self.view, animated: true)
            print(error.localizedDescription)
        }
    }
}
