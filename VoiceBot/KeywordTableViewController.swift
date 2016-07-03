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
    @IBOutlet weak var myNavigationBar: UINavigationBar!
    var array:NSArray = []
    override func viewDidLoad() {
        super.viewDidLoad()
        keywordTable.delegate = self
        keywordTable.dataSource = self

        // Do any additional setup after loading the view.
        
        myNavigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Arial-BoldMT", size: 18)!, NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        let URL = NSURL(string: "https://spajam-funkey.herokuapp.com/all")
        let req = NSURLRequest(URL: URL!)
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration, delegate:nil, delegateQueue:NSOperationQueue.mainQueue())
        
        let task = session.dataTaskWithRequest(req, completionHandler: {
            (data, response, error) -> Void in
            do {
                //print(data)
                 self.array = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as! NSArray
                print(self.array)
                print(self.array.count)
                self.keywordTable.reloadData()
            } catch {
                //エラー処理
            }
            
        })
        task.resume()
        


    }
    
    
    
    
    //セル内容の変更
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = keywordTable.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath)
        
        let phraseDictionary = self.array[indexPath.row]
        
        let keywordlabel = keywordTable.viewWithTag(1) as! UILabel
        keywordlabel.text = phraseDictionary["phrase"]?! as! String
        let actionlabel = keywordTable.viewWithTag(2) as! UILabel
        actionlabel.text = phraseDictionary["action"]?! as! String
        
        return cell
        
    }
    
    func getRandomNumber(Min _Min : Float, Max _Max : Float)->Float {
        
        return ( Float(arc4random_uniform(UINT32_MAX)) / Float(UINT32_MAX) ) * (_Max - _Min) + _Min
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.array.count
        
    }
    
    func colorForIndex(index: Int) -> UIColor {
//        let itemCount = 1
//        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        var random_color:Float
        if(index % 2 == 1){
            random_color = getRandomNumber(Min: 0.1, Max: 0.25)
        }else{
            random_color = getRandomNumber(Min: 0.25, Max: 0.35)
        }
        print(random_color)
        return UIColor(red: CGFloat(random_color), green: CGFloat(random_color), blue: CGFloat(random_color+0.1), alpha: 1.0)
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
                            forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = colorForIndex(indexPath.row)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("detail", sender:nil)
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
