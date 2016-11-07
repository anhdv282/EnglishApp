//
//  MenuPDFViewController.swift
//  PracticalEnglish
//
//  Created by mac on 9/28/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit
import PDFReader
import MBProgressHUD
class PE_PDFViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var listPDF = ["Hướng dẫn đọc hiểu - Tập 1","Hướng dẫn đọc hiểu - Tập 2","Hướng dẫn đọc hiểu - Tập 3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: "CommonTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "CommonTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /// Initializes a document with the name of the pdf in the file system
    ///
    /// - parameter name: name of the pdf in the file system
    ///
    /// - returns: a document
    fileprivate func document(_ name: String) -> PDFDocument? {
        guard let documentURL = Bundle.main.url(forResource: name, withExtension: "pdf") else { return nil }
        return PDFDocument(fileURL: documentURL)
    }
    
    
    /// Presents a document
    ///
    /// - parameter document: document to present
    fileprivate func showDocument(_ document: PDFDocument) {
        let image = UIImage(named: "")
        MBProgressHUD.hide(for: self.tableView, animated: true)
        let controller = PDFViewController.createNew(with: document, title: "", actionButtonImage: image, actionStyle: .activitySheet)
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension PE_PDFViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        MBProgressHUD.showAdded(to: self.tableView, animated: true)
        if let doc = document(listPDF[indexPath.row]) {
            showDocument(doc)
        } else {
            MBProgressHUD.hide(for: self.tableView, animated: true)
//            print("Document named \(listPDF[indexPath.row]) not found in the file system")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommonTableViewCell") as! CommonTableViewCell
        cell.lblTitle.text = listPDF[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPDF.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
