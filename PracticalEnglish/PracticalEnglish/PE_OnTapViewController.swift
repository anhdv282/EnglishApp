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
import RealmSwift
class PE_OnTapViewController: BackgroundViewController {
    var listOnTap: Results<PE_Chapter>!
    var listQuestion: Results<PE_Question>!
    @IBOutlet weak var onTapTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onTapTableView.register(UINib(nibName: "PE_OnTapTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "PE_OnTapTableViewCell")
        // Do any additional setup after loading the view.
        self.getDataOnTap()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDataOnTap() {
        let realm = try! Realm()
        self.listOnTap = realm.objects(PE_Chapter.self)
        self.onTapTableView.reloadData()
    }
    
    func pushVC(listQuestion:[PE_Question],lblText:String) {
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

    }
    
    @IBAction func clickTrongAmBtn(_ sender: AnyObject) {

    }
}

extension PE_OnTapViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PE_OnTapTableViewCell") as! PE_OnTapTableViewCell
        let list = listOnTap[indexPath.row]
        cell.lblTitle.text = list.content
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let listsTasks = listOnTap {
            return listsTasks.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chapter = listOnTap[indexPath.row]
        
        if chapter.parts.count > 1 {

            print("Hello")
        } else if chapter.parts.count == 1 {
            let lesson = chapter.parts[0]
            let listQuestion = lesson.listQuestion
            var listQQ:[PE_Question] = [PE_Question]()
            for q in listQuestion {
                listQQ.append(q)
            }
            pushVC(listQuestion: listQQ, lblText: listOnTap[indexPath.row].descriptionChapter)
        }
    }
}

