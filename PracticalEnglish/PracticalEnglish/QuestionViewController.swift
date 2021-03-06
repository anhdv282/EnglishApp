//
//  QuestionViewController.swift
//  PracticalEnglish
//
//  Created by mac on 9/24/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit
import Firebase
import MBProgressHUD
class QuestionViewController: BackgroundViewController {
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var navItem: UINavigationItem!
    
    var listMainQuestion = [Lesson]()
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.estimatedRowHeight = 60
        myTableView.register(UINib(nibName: "MenuQuestionTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "MenuQuestionTableViewCell")
        // Do any additional setup after loading the view.
        self.getData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.myTableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        let rootRef = FIRDatabase.database().reference().child("Grammar")
        rootRef.observe(.value, with: { (snapshot) in
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                var i = 0
                for snap in snapshots {
                    i += 1
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        let grammar:Lesson = Lesson()
                        var questions:[Question] = [Question]()
                        grammar.content = postDict["Content"] as! String
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
                        self.listMainQuestion.append(grammar)
                    }
                }
                self.myTableView.reloadData()
                MBProgressHUD.hide(for: self.view, animated: true)
            } else {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
            
        }) { (error) in
            MBProgressHUD.hide(for: self.view, animated: true)
            print(error.localizedDescription)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PlayViewController,
            let indexPath = myTableView.indexPathForSelectedRow {
            //            destination.grammar = listGrammar[indexPath.row]
        }
    }
}

extension QuestionViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SoundController.playClickButton()
        let playVC = (self.storyboard!.instantiateViewController(withIdentifier: "PlayViewController") as! PlayViewController)
//        playVC.listQuestion = listMainQuestion[indexPath.row].listQuestion
        playVC.questionText = "Choose a,b,c or d that best completes the sentence"
        self.navigationController!.pushViewController(playVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMainQuestion.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuQuestionTableViewCell") as! MenuQuestionTableViewCell
        cell.content.text = listMainQuestion[indexPath.row].content
        cell.headerTitle.backgroundColor = colorGray
        return cell
    }
    
}
