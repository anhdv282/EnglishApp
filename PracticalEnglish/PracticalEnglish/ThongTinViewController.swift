//
//  ThongTinViewController.swift
//  PracticalEnglish
//
//  Created by mac on 9/26/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit

class ThongTinViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickTimGiaSu(_ sender: AnyObject) {
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
    
    @IBAction func clickGroupFB(_ sender: AnyObject) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
