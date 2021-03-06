//
//  KeywordDetailViewController.swift
//  VoiceBot
//
//  Created by Kudo Takuya on 2016/07/03.
//  Copyright © 2016年 Kudo Takuya. All rights reserved.
//

import UIKit

class KeywordDetailViewController: UIViewController {

    @IBOutlet weak var myNavigationBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        myNavigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Arial-BoldMT", size: 18)!, NSForegroundColorAttributeName: UIColor.whiteColor()]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
