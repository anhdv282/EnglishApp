//
//  OnTapViewController.swift
//  PracticalEnglish
//
//  Created by mac on 9/27/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit
import MBProgressHUD
import Firebase
class OnTapViewController: BackgroundViewController {
    var listQuestionPhatAm:[Question] = [Question]()
    var listQuestionTrongAm:[Question] = [Question]()
    var listOnTap:[String:String] = [String:String]()
    
    @IBOutlet weak var onTapTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listQuestionTrongAm.removeAll()
        listQuestionPhatAm.removeAll()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDataPhatAm() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        let rootRef = FIRDatabase.database().reference().child("PhatAm")
        rootRef.observe(.value, with: { (snapshot) in
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                var i = 0
                for snap in snapshots {
                    i += 1
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        let question:Question = Question()
                        if let answer0 = postDict["Answer 0"] as? String {
                            question.Answer0 = answer0
                        }
                        if let answer1 = postDict["Answer 1"] as? String {
                            question.Answer1 = answer1
                        }
                        if let answer2 = postDict["Answer 2"] as? String {
                            question.Answer2 = answer2
                        }
                        if let answer3 = postDict["Answer 3"] as? String {
                            question.Answer3 = answer3
                        }
                        if let a = postDict["IsCorrect"] as? NSNumber {
                            let aString = a.intValue
                            question.IsCorrect = aString
                        }
                        if let a = postDict["Id"] as? NSNumber {
                            let aString = a.intValue
                            question.iD = aString
                        }
                        self.listQuestionPhatAm.append(question)
                    }
                }
                MBProgressHUD.hide(for: self.view, animated: true)
                self.pushVC(listQuestion: self.listQuestionPhatAm,lblText: "Pick out the word which has the underlined part pronounced different from the rest")
            } else {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
            
        }) { (error) in
           
            MBProgressHUD.hide(for: self.view, animated: true)
            print(error.localizedDescription)
        }
    }
    
    func getDataTrongAm() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        let rootRef = FIRDatabase.database().reference().child("TrongAm")
        rootRef.observe(.value, with: { (snapshot) in
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                var i = 0
                for snap in snapshots {
                    i += 1
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        let question:Question = Question()
                        if let _question = postDict["Question"] as? String {
                            question.Question = _question
                        }
                        if let answer0 = postDict["Answer0"] as? String {
                            question.Answer0 = answer0
                        }
                        if let answer1 = postDict["Answer1"] as? String {
                            question.Answer1 = answer1
                        }
                        if let answer2 = postDict["Answer2"] as? String {
                            question.Answer2 = answer2
                        }
                        if let answer3 = postDict["Answer3"] as? String {
                            question.Answer3 = answer3
                        }
                        if let a = postDict["IsCorrect"] as? NSNumber {
                            let aString = a.intValue
                            question.IsCorrect = aString
                        }
                        if let a = postDict["Id"] as? NSNumber {
                            let aString = a.intValue
                            question.iD = aString
                        }
                        self.listQuestionTrongAm.append(question)
                    }
                }
                MBProgressHUD.hide(for: self.view, animated: true)
                self.pushVC(listQuestion: self.listQuestionTrongAm,lblText: "Pick out the word that has the stress pattern different from that of the other words")
            } else {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
            
        }) { (error) in
            
            MBProgressHUD.hide(for: self.view, animated: true)
            print(error.localizedDescription)
        }
    }
    
    func pushVC(listQuestion:[Question],lblText:String) {
        let playVC = (self.storyboard!.instantiateViewController(withIdentifier: "PlayViewController") as! PlayViewController)
        playVC.listQuestion = listQuestion
        playVC.questionText = lblText
        self.navigationController!.pushViewController(playVC, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "PhatAmSegue" {
//            let nextScene =  segue.destination as! PlayViewController
////            getDataPhatAm()
//            
////            self.navigationController?.pushViewController(nextScene, animated: true)
//        } else if segue.identifier == "TrongAmSegue" {
//            
//        }
    }
    
    @IBAction func clickPhatAmBtn(_ sender: AnyObject) {
        self.getDataPhatAm()
    }
    
    @IBAction func clickTrongAmBtn(_ sender: AnyObject) {
        self.getDataTrongAm()
    }
}

extension OnTapViewController:UITabBarDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOnTap.count
    }
}
