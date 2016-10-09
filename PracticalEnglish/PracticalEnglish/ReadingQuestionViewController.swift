//
//  ReadingQuestionViewController.swift
//  PracticalEnglish
//
//  Created by mac on 9/27/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit

class ReadingQuestionViewController: UIViewController {
    @IBOutlet weak var myCollectionView: UICollectionView!

    @IBOutlet weak var btnQuestion: UIButton!
    @IBOutlet weak var myTextField: UITextView!

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myContentView: UIView!
    
    @IBOutlet weak var lblText: UILabel!
    var reading:MainQuestion = MainQuestion()
    var listQuestion:[Question] = [Question]()
    var selectedIndexPaths = NSMutableSet()
    var myIndex:Int = 0
    var mark:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        myCollectionView.register(UINib(nibName: "PlayCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "PlayCollectionViewCell")
        myTableView.register(UINib(nibName: "AnswerTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "AnswerTableViewCell")
        myTableView.register(UINib(nibName: "QuestionTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "QuestionTableViewCell")
        myTextField.text = reading.mainQuestion
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.estimatedRowHeight = 60
        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickQuestionBtn(_ sender: UIButton) {
        myContentView.isHidden = !myContentView.isHidden
        btnQuestion.setTitle((myContentView.isHidden) ? "Câu hỏi" : "Bài đọc", for: .normal)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        myTextField.isScrollEnabled = false
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        myTextField.isScrollEnabled = true
        NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.myTableView.reloadData()
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//            self.fakeView.isHidden = true
            self.myIndex += 1
            if self.myIndex >= self.listQuestion.count {
                // create the alert
                let alert = UIAlertController(title: "Bạn đã hoàn thành bài này", message: "Điểm số của bạn \(self.mark)/\(self.listQuestion.count)", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "Trở về", style: .default, handler: { (action) in
                    for q in self.listQuestion {
                        q.state = .NotSelected
                    }
                    self.navigationController?.popViewController(animated: true)
                }))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                
            } else {
                self.myTableView.isUserInteractionEnabled = true
                self.myTableView.reloadData()
                self.myCollectionView.reloadData()
            }
        }
    }
}

//extension ReadingQuestionViewController: UITableViewDelegate,UITableViewDataSource {
//    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        if indexPath.row == 0 {
//            return nil
//        }
//        return indexPath
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return listQuestion.count
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//    
//    func configure(cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        
//        if selectedIndexPaths.contains(indexPath) {
//            // selected
//            
//        }
//        else {
//            // not selected
//            
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cellIndexPath:IndexPath = IndexPath.init(row: 0, section: 0)
//        let cell = tableView.cellForRow(at: indexPath) as! AnswerTableViewCell
//        if selectedIndexPaths.contains(indexPath) {
//            // deselect
////            selectedIndexPaths.remove(indexPath)
//        }
//        else {
//            // select
//            selectedIndexPaths.add(indexPath)
//            //
//            
//            switch indexPath.row {
//            case 0:
//                print("Can't click")
//                break
//            case 1:
//                if listQuestion[indexPath.section].IsCorrect == 0 {
//                    cell.borderView.backgroundColor = colorRight
//                    listQuestion[indexPath.section].state = .RightSelected
//                    mark += 1
//                    print("Dung")
//                    
//                } else {
//                    cell.borderView.backgroundColor = colorWrong
//                    //                cellR.borderView.backgroundColor = colorRight
//                    listQuestion[indexPath.section].state = .WrongSelected
//                    print("Sai")
//                }
//                
//            case 2:
//                if listQuestion[indexPath.section].IsCorrect == 1 {
//                    cell.borderView.backgroundColor = colorRight
//                    listQuestion[indexPath.section].state = .RightSelected
//                    mark += 1
//                    print("Dung")
//                } else {
//                    cell.borderView.backgroundColor = colorWrong
//                    //                cellR.borderView.backgroundColor = colorRight
//                    listQuestion[indexPath.section].state = .WrongSelected
//                    print("Sai")            }
//            case 3:
//                if listQuestion[indexPath.section].IsCorrect == 2 {
//                    cell.borderView.backgroundColor = colorRight
//                    listQuestion[indexPath.section].state = .RightSelected
//                    mark += 1
//                    print("Dung")
//                } else {
//                    cell.borderView.backgroundColor = colorWrong
//                    //                cellR.borderView.backgroundColor = colorRight
//                    listQuestion[indexPath.section].state = .WrongSelected
//                    print("Sai")
//                }
//            case 4:
//                if listQuestion[indexPath.section].IsCorrect == 3 {
//                    cell.borderView.backgroundColor = colorRight
//                    listQuestion[indexPath.section].state = .RightSelected
//                    mark += 1
//                    print("Dung")
//                } else {
//                    cell.borderView.backgroundColor = colorWrong
//                    //                cellR.borderView.backgroundColor = colorRight
//                    listQuestion[indexPath.section].state = .WrongSelected
//                    print("Sai")
//                }
//            default:
//                break
//            }
//        }
//        
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellQuestion = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell") as! QuestionTableViewCell
//        let cellAnswer = tableView.dequeueReusableCell(withIdentifier: "AnswerTableViewCell") as! AnswerTableViewCell
//        let q:Question = listQuestion[indexPath.section]
//        if selectedIndexPaths.contains(indexPath) {
//            // selected
//            switch indexPath.row {
//            case 0:
//                cellQuestion.questionContent.text = q.Question
//                return cellQuestion
//            case 1:
//                cellAnswer.content.text = q.Answer0
//                cellAnswer.headerTitle.text = "A."
//                //            cellAnswer.setModel()
//                return cellAnswer
//            case 2:
//                cellAnswer.content.text = q.Answer1
//                cellAnswer.headerTitle.text = "B."
//                //            cellAnswer.setModel()
//                return cellAnswer
//            case 3:
//                cellAnswer.content.text = q.Answer2
//                cellAnswer.headerTitle.text = "C."
//                //            cellAnswer.setModel()
//                return cellAnswer
//            case 4:
//                cellAnswer.content.text = q.Answer3
//                cellAnswer.headerTitle.text = "D."
//                //            cellAnswer.setModel()
//                return cellAnswer
//            default:
//                return cellQuestion
//                
//            }
//        }
//        else {
//            // not selected
//            switch indexPath.row {
//            case 0:
//                cellQuestion.questionContent.text = q.Question
//                return cellQuestion
//            case 1:
//                cellAnswer.content.text = q.Answer0
//                cellAnswer.headerTitle.text = "A."
//                cellAnswer.backgroundColor = UIColor.clear
//                //            cellAnswer.setModel()
//                return cellAnswer
//            case 2:
//                cellAnswer.content.text = q.Answer1
//                cellAnswer.headerTitle.text = "B."
//                cellAnswer.backgroundColor = UIColor.clear
//                //            cellAnswer.setModel()
//                return cellAnswer
//            case 3:
//                cellAnswer.content.text = q.Answer2
//                cellAnswer.headerTitle.text = "C."
//                cellAnswer.backgroundColor = UIColor.clear
//                //            cellAnswer.setModel()
//                return cellAnswer
//            case 4:
//                cellAnswer.content.text = q.Answer3
//                cellAnswer.headerTitle.text = "D."
//                cellAnswer.backgroundColor = UIColor.clear
//                //            cellAnswer.setModel()
//                return cellAnswer
//            default:
//                return cellQuestion
//                
//            }
//        }
//        
//    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 30
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Câu \(listQuestion[section].iD)"
//    }
//}

extension ReadingQuestionViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 0 {
            return nil
        }
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rightAnswer = listQuestion[myIndex].IsCorrect + 1
        let path2:IndexPath = IndexPath.init(row: rightAnswer, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! AnswerTableViewCell
        let cellR = tableView.cellForRow(at: path2) as! AnswerTableViewCell
        switch indexPath.row {
        case 0:
            break
        case 1:
            if listQuestion[myIndex].IsCorrect == 0 {
                cell.borderView.backgroundColor = colorRight
                listQuestion[myIndex].state = .RightSelected
                mark += 1
                SoundController.playRight()
                
            } else {
                cell.borderView.backgroundColor = colorWrong
                cellR.borderView.backgroundColor = colorRight
                listQuestion[myIndex].state = .WrongSelected
                SoundController.playWrong()
            }
            
        case 2:
            if listQuestion[myIndex].IsCorrect == 1 {
                cell.borderView.backgroundColor = colorRight
                listQuestion[myIndex].state = .RightSelected
                mark += 1
                SoundController.playRight()
            } else {
                cell.borderView.backgroundColor = colorWrong
                cellR.borderView.backgroundColor = colorRight
                listQuestion[myIndex].state = .WrongSelected
                SoundController.playWrong()
            }
        case 3:
            if listQuestion[myIndex].IsCorrect == 2 {
                cell.borderView.backgroundColor = colorRight
                listQuestion[myIndex].state = .RightSelected
                mark += 1
                SoundController.playRight()
            } else {
                cell.borderView.backgroundColor = colorWrong
                cellR.borderView.backgroundColor = colorRight
                listQuestion[myIndex].state = .WrongSelected
                SoundController.playWrong()
            }
        case 4:
            if listQuestion[myIndex].IsCorrect == 3 {
                cell.borderView.backgroundColor = colorRight
                listQuestion[myIndex].state = .RightSelected
                mark += 1
                SoundController.playRight()
            } else {
                cell.borderView.backgroundColor = colorWrong
                cellR.borderView.backgroundColor = colorRight
                listQuestion[myIndex].state = .WrongSelected
                SoundController.playWrong()
            }
        default:
            break
        }
        self.myTableView.isUserInteractionEnabled = false
//        self.lblMark.text = "\(mark)/\(listQuestion.count)"
//        self.fakeView.isHidden = false
        self.delay(delay: 2) {
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellQuestion = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell") as! QuestionTableViewCell
        let cellAnswer = tableView.dequeueReusableCell(withIdentifier: "AnswerTableViewCell") as! AnswerTableViewCell
        switch indexPath.row {
        case 0:
            cellQuestion.questionContent.text = "(\(myIndex+1)) : \(listQuestion[myIndex].Question)"
            return cellQuestion
        case 1:
            cellAnswer.content.text = listQuestion[myIndex].Answer0
            cellAnswer.headerTitle.text = "A."
            cellAnswer.setModel()
            return cellAnswer
        case 2:
            cellAnswer.content.text = listQuestion[myIndex].Answer1
            cellAnswer.headerTitle.text = "B."
            cellAnswer.setModel()
            return cellAnswer
        case 3:
            cellAnswer.content.text = listQuestion[myIndex].Answer2
            cellAnswer.headerTitle.text = "C."
            cellAnswer.setModel()
            return cellAnswer
        case 4:
            cellAnswer.content.text = listQuestion[myIndex].Answer3
            cellAnswer.headerTitle.text = "D."
            cellAnswer.setModel()
            return cellAnswer
        default:
            return cellQuestion
        }
    }
    
}

extension ReadingQuestionViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reading.listQuestion.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayCollectionViewCell", for: indexPath) as! PlayCollectionViewCell
        cell.lblNumber.text = "\(reading.listQuestion[indexPath.row].iD)"
        if reading.listQuestion[indexPath.row].iD == myIndex {
            cell.borderBgView.layer.borderColor = colorSelectCollection.cgColor
        } else {
            cell.borderBgView.layer.borderColor = UIColor.white.cgColor
        }
        if listQuestion[indexPath.row].state == .NotSelected {
            cell.borderBgView.backgroundColor = colorGray
        } else if listQuestion[indexPath.row].state == .RightSelected {
            cell.borderBgView.backgroundColor = colorRight
        } else if listQuestion[indexPath.row].state == .WrongSelected {
            cell.borderBgView.backgroundColor = colorWrong
        } else {
            cell.borderBgView.backgroundColor = colorGray
        }
        return cell
    }
}
