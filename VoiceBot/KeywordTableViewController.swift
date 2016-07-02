//
//  KeywordTableViewController.swift
//  VoiceBot
//
//  Created by Kudo Takuya on 2016/07/02.
//  Copyright © 2016年 Kudo Takuya. All rights reserved.
//

import UIKit

class KeywordTableViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var keywordTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        keywordTable.delegate = self
        keywordTable.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    //セル内容の変更
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = keywordTable.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath)
        
        return cell
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButtonAction(sender: AnyObject) {
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
