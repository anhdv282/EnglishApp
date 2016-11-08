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

    }
    
    @IBAction func clickTrongAmBtn(_ sender: AnyObject) {

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
