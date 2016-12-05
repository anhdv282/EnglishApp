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
import FirebaseDatabase
import MBProgressHUD
let kIsDownloadData = "isDownloadData"
class PE_ViewController: BackgroundViewController {
    
    @IBOutlet weak var loadingView: UIView!
    
    @IBOutlet weak var lblCountDownload: UILabel!
    @IBOutlet weak var lblLoading: UILabel!
    var loginButton:FBSDKLoginButton = FBSDKLoginButton()
    var timer : Timer?
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateProgressView), userInfo: nil, repeats: true)
        
        if defaults.bool(forKey: kIsDownloadData) == false {
            self.requestData()
        }
    }
    
    func requestData() {
        self.loadingView.isHidden = false
        MBProgressHUD.showAdded(to: self.view, animated: true)
        let rootRef = FIRDatabase.database().reference()
        let newData = rootRef.child("NewData")
        newData.observe(.value, with: { (snapshot) in
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                var data:[Chapter] = [Chapter]()
                for snap in snapshots {
                    let chapter:Chapter = Chapter()
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        var lessons:[Lesson] = [Lesson]()
                        if let _chapterId = postDict["Id"] as? Int {
                            chapter.id = _chapterId
                        }
                        if let _chapterContent = postDict["Content"] as? String {
                            chapter.content = _chapterContent
                        }
                        if let _descriptionChapter = postDict["Description"] as? String {
                            chapter.descriptionChapter = _descriptionChapter
                        }
                        let peChapter:PE_Chapter = writeDataChapter(chapter: chapter)
                        if let lessonsDict = postDict["Parts"] as? [[String : AnyObject]] {
                            for lessonDict in lessonsDict {
                                let lesson:Lesson = Lesson()
                                var questions:[Question] = [Question]()
                                if let _lessonContent = lessonDict["Content"] as? String {
                                    lesson.content = _lessonContent
                                }
                                if let _lessonId = lessonDict["Id"] as? Int {
                                    lesson.id = _lessonId
                                }
                                let peLesson:PE_Lesson = writeDataLesson(lesson: lesson, peChapter: peChapter)
                                if let questionsDict = lessonDict["ListQuestion"] as? [[String : AnyObject]] {
                                    for questionDict in questionsDict {
                                        let question:Question = Question()
                                        if let _question = questionDict["Question"] as? String {
                                            question.Question = _question
                                        }
                                        if let _a0 = questionDict["Answer0"] as? String {
                                            question.Answer0 = _a0
                                        }
                                        if let _a1 = questionDict["Answer1"] as? String {
                                            question.Answer1 = _a1
                                        }
                                        if let _a2 = questionDict["Answer2"] as? String {
                                            question.Answer2 = _a2
                                        }
                                        if let _a3 = questionDict["Answer3"] as? String {
                                            question.Answer3 = _a3
                                        }
                                        if let _correct = questionDict["IsCorrect"] as? Int {
                                            question.IsCorrect = _correct
                                        }
                                        if let a = questionDict["Id"] as? Int {
                                            question.iD = a
                                        }
                                        question.state = QuestionState.NotSelected
                                        writeDataQuestion(question: question, peLesson: peLesson)
                                        questions.append(question)
                                    }
                                    lesson.listQuestion = questions
                                }
                                lessons.append(lesson)
                            }
                            chapter.parts = lessons
                        }
                    }
                    data.append(chapter)
                }
                self.loadingView.isHidden = true
                self.timer?.invalidate()
                MBProgressHUD.hide(for: self.view, animated: true)
                self.defaults.set(true, forKey: kIsDownloadData)
            }
            
        }) { (error) in
            MBProgressHUD.hide(for: self.view, animated: true)
            showAlertView(self, title: "Error", message: "Không thể tải được dữ liệu")
            self.loadingView.isHidden = true
            print(error.localizedDescription)
        }
    }
    
    func saveToLocal() {
        
    }
 
    @IBAction func clickOnThiBtn(_ sender: AnyObject) {
        let alert:UIAlertController = UIAlertController.init(title: "Thông báo", message: "Tính năng này sẽ cập nhật sau", preferredStyle: .alert)
        let alertAction:UIAlertAction = UIAlertAction(title: "Bỏ qua", style: .cancel) { (action) in
            
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func clickGiaSuBtn(_ sender: AnyObject) {
        let urls = ["fb://page/gstienganhngoaithuong",
                    "https://m.facebook.com/gstienganhngoaithuong"];
        let application = UIApplication.shared
        
        for urlString in urls {
            let url = NSURL(string: urlString)
            if(application.canOpenURL(url! as URL))
            {
                application.openURL(url! as URL)
                return
            }
        }
    }
    
    @IBAction func clickGroupBtn(_ sender: AnyObject) {
        let urls = ["fb://group?id=149129658853592",
                    "https://m.facebook.com/149129658853592"];
        
        let application = UIApplication.shared
        
        for urlString in urls {
            let url = NSURL(string: urlString)
            if(application.canOpenURL(url! as URL))
            {
                application.openURL(url! as URL)
                return
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowOnTapSegue" {
//            if let onTapVc = segue.destination as? OnTapViewController {
//                
//            }
//        }
    }
    
    func updateProgressView(){
        if lblLoading.text == "Cập nhật" {
            lblLoading.text = "Cập nhật."
        }
        else if lblLoading.text == "Cập nhật." {
            lblLoading.text = "Cập nhật.."
        }
        else if lblLoading.text == "Cập nhật.." {
            lblLoading.text = "Cập nhật..."
        }
        else if lblLoading.text == "Cập nhật..." {
            lblLoading.text = "Cập nhật"
        }
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
