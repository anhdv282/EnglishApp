//
//  ReadingViewController.swift
//  PracticalEnglish
//
//  Created by mac on 9/27/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit
import MBProgressHUD
import Firebase
class ReadingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var listMainQuestion:[Lesson] = [Lesson]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
        tableView.register(UINib(nibName: "MenuQuestionTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "MenuQuestionTableViewCell")
        self.getData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
    
    func getData() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        let rootRef = FIRDatabase.database().reference().child("Reading")
        rootRef.observe(.value, with: { (snapshot) in
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                var i = 0
                for snap in snapshots {
                    i += 1
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        let reading:Lesson = Lesson()
                        var questions:[Question] = [Question]()
                        reading.content = postDict["Content"] as! String
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
                        reading.listQuestion = questions
                        reading.id = i
                        self.listMainQuestion.append(reading)
                    }
                }
                self.tableView.reloadData()
                MBProgressHUD.hide(for: self.view, animated: true)
            }
            
        }) { (error) in
            MBProgressHUD.hide(for: self.view, animated: true)
            print(error.localizedDescription)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ReadingQuestionViewController,
            let indexPath = self.tableView.indexPathForSelectedRow {
//            destination.reading = listMainQuestion[indexPath.row]
            destination.listQuestion = listMainQuestion[indexPath.row].listQuestion
        }
    }
}

extension ReadingViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SoundController.playClickButton()
        let readingVC = (self.storyboard!.instantiateViewController(withIdentifier: "ReadingQuestionViewController") as! ReadingQuestionViewController)
        readingVC.listQuestion = listMainQuestion[indexPath.row].listQuestion
//        readingVC.reading = listMainQuestion[indexPath.row]
        self.navigationController!.pushViewController(readingVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMainQuestion.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuQuestionTableViewCell") as! MenuQuestionTableViewCell
        cell.content.text = "Bài \(listMainQuestion[indexPath.row].id)"
        cell.headerTitle.backgroundColor = colorGray
        return cell
    }
}
