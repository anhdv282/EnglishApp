//
//  PlayViewController.swift
//  PracticalEnglish
//
//  Created by mac on 9/24/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit

class PlayViewController: BackgroundViewController {
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblMark: UILabel!
    
    @IBOutlet weak var lblText: UILabel!
    var questionText = ""
//    var grammar:Grammar = Grammar()
    var listQuestion:[PE_Question] = [PE_Question]()
    var index:Int = 0
    var mark:Int = 0
    private var isInsertingCellsToTop: Bool = false
    private var contentSizeWhenInsertingToTop: CGSize?
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.estimatedRowHeight = 60
//        listQuestion = grammar.listQuestion
        self.lblMark.text = "\(mark)/\(listQuestion.count)"
        self.lblText.text = questionText
        // Do any additional setup after loading the view.
        collectionView.register(UINib(nibName: "PlayCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "PlayCollectionViewCell")
        myTableView.register(UINib(nibName: "AnswerTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "AnswerTableViewCell")
        myTableView.register(UINib(nibName: "QuestionTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "QuestionTableViewCell")
    }
    
    @IBAction func clickPreviousBtn(_ sender: UIButton) {
        self.index -= 1
        self.myTableView.reloadData()
        self.collectionView.reloadData()
    }
    
    @IBAction func clickNextBtn(_ sender: UIButton) {
        self.index += 1
        if self.index >= self.listQuestion.count {
            // create the alert
            let alert = UIAlertController(title: "Bạn đã hoàn thành bài ôn tập", message: "Điểm số của bạn \(self.mark)/\(self.listQuestion.count)", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "Trở về", style: .default, handler: { (action) in
                for q in self.listQuestion {
                    q.questionState = 0// .NotSelected
                }
                self.navigationController?.popViewController(animated: true)
            }))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
            
        } else {
            self.myTableView.reloadData()
            self.collectionView.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.myTableView.reloadData()
        }
    }

//    override func viewDidLayoutSubviews() {
//        self.collectionView.scrollToItem(at: IndexPath.init(row: index, section: 0), at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
//    }
    
    func delay(delay:Double, closure:()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.myTableView.isUserInteractionEnabled = true
            self.index += 1
            if self.index >= self.listQuestion.count {
                // create the alert
                let alert = UIAlertController(title: "Bạn đã hoàn thành bài ôn tập", message: "Điểm số của bạn \(self.mark)/\(self.listQuestion.count)", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "Trở về", style: .default, handler: { (action) in
                    for q in self.listQuestion {
                        q.questionState = 0// .NotSelected
                    }
                    self.navigationController?.popViewController(animated: true)
                }))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                
            } else {
                self.myTableView.reloadData()
                self.collectionView.reloadData()
            }
        }
    }
}

extension PlayViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 0 {
            return nil
        }
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rightAnswer = listQuestion[index].isCorrect + 1
        let path2:IndexPath = IndexPath.init(row: rightAnswer, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! AnswerTableViewCell
        let cellR = tableView.cellForRow(at: path2) as! AnswerTableViewCell
        switch indexPath.row {
        case 0:
            break
        case 1:
            if listQuestion[index].isCorrect == 0 {
                cell.borderView.backgroundColor = colorRight
                updateDataQuestion(question: listQuestion[index],questionState: 1)
                mark += 1
                SoundController.playRight()
                
            } else {
                cell.borderView.backgroundColor = colorWrong
                cellR.borderView.backgroundColor = colorRight
                updateDataQuestion(question: listQuestion[index],questionState: 2)
                SoundController.playWrong()
            }
            
        case 2:
            if listQuestion[index].isCorrect == 1 {
                cell.borderView.backgroundColor = colorRight
                updateDataQuestion(question: listQuestion[index],questionState: 1)
                mark += 1
                SoundController.playRight()
            } else {
                cell.borderView.backgroundColor = colorWrong
                cellR.borderView.backgroundColor = colorRight
                updateDataQuestion(question: listQuestion[index],questionState: 2)
                SoundController.playWrong()
            }
        case 3:
            if listQuestion[index].isCorrect == 2 {
                cell.borderView.backgroundColor = colorRight
                updateDataQuestion(question: listQuestion[index],questionState: 1)
                mark += 1
                SoundController.playRight()
            } else {
                cell.borderView.backgroundColor = colorWrong
                cellR.borderView.backgroundColor = colorRight
                updateDataQuestion(question: listQuestion[index],questionState: 2)
                SoundController.playWrong()
            }
        case 4:
            if listQuestion[index].isCorrect == 3 {
                cell.borderView.backgroundColor = colorRight
                updateDataQuestion(question: listQuestion[index],questionState: 1)
                mark += 1
                SoundController.playRight()
            } else {
                cell.borderView.backgroundColor = colorWrong
                cellR.borderView.backgroundColor = colorRight
                updateDataQuestion(question: listQuestion[index],questionState: 2)
                SoundController.playWrong()
            }
        default:
            break
        }
        
        
        self.lblMark.text = "\(mark)/\(listQuestion.count)"
        self.myTableView.isUserInteractionEnabled = false
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
            cellQuestion.questionContent.text = listQuestion[index].question
            return cellQuestion
        case 1:
            cellAnswer.content.text = listQuestion[index].answer0
            cellAnswer.headerTitle.text = "A."
            
            cellAnswer.setModel()
            return cellAnswer
        case 2:
            cellAnswer.content.text = listQuestion[index].answer1
            cellAnswer.headerTitle.text = "B."
            cellAnswer.setModel()
            return cellAnswer
        case 3:
            cellAnswer.content.text = listQuestion[index].answer2
            cellAnswer.headerTitle.text = "C."
            cellAnswer.setModel()
            return cellAnswer
        case 4:
            cellAnswer.content.text = listQuestion[index].answer3
            cellAnswer.headerTitle.text = "D."
            cellAnswer.setModel()
            return cellAnswer
        default:
            return cellQuestion
        }
    }
    
}

extension PlayViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listQuestion.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayCollectionViewCell", for: indexPath) as! PlayCollectionViewCell
        
        cell.lblNumber.text = "\(indexPath.row+1)"
        if indexPath.row == index {
            cell.borderBgView.layer.borderColor = colorSelectCollection.cgColor
        } else {
            cell.borderBgView.layer.borderColor = UIColor.white.cgColor
        }
        if listQuestion[indexPath.row].questionState == 0 {
            cell.borderBgView.backgroundColor = colorGray
        } else if listQuestion[indexPath.row].questionState == 1 {
            cell.borderBgView.backgroundColor = colorRight
        } else if listQuestion[indexPath.row].questionState == 2 {
            cell.borderBgView.backgroundColor = colorWrong
        } else {
            cell.borderBgView.backgroundColor = colorGray
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
