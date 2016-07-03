//
//  AddKeywordViewController.swift
//  VoiceBot
//
//  Created by Kudo Takuya on 2016/07/02.
//  Copyright © 2016年 Kudo Takuya. All rights reserved.
//

import UIKit

class AddKeywordViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var selectpicker: UIPickerView!
    @IBOutlet weak var myNavigationBar: UINavigationBar!
    
    var action:String!
    
    
    var categoryArr: NSArray = ["電気をつける","電気の色をピンクに変える","電気の色を青に変える","電気の色を白に変える","電気の色を黄色に変える",]
    override func viewDidLoad() {
        super.viewDidLoad()
        selectpicker.dataSource = self
        selectpicker.delegate = self
        myNavigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Arial-BoldMT", size: 18)!, NSForegroundColorAttributeName: UIColor.whiteColor()]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryArr.count
    }
    
//    //表示内容
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return categoryArr[row] as? String
//    }
    
    //選択時
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("列: \(row)")
        print("値: \(categoryArr[row])")
        action = categoryArr[row] as! String
    }
    
//    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//        
//        let titleData = categoryArr[row]
//        let myTitle = NSAttributedString(string: titleData as! String, attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
//        
//        return myTitle
//    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView
    {
        var pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.whiteColor()
        pickerLabel.text = categoryArr[row] as! String
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        pickerLabel.font = UIFont(name: "Arial-BoldMT", size: 15) // In this use your custom font
        pickerLabel.textAlignment = NSTextAlignment.Center
        return pickerLabel
    }
    
    @IBAction func backButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func addButton(sender: AnyObject) {
        print(self.myTextField.text)
        print(action)
        
        let parameters = ["phrase":self.myTextField.text!, "action":action] as Dictionary<String, String>
        let request = NSMutableURLRequest(URL: NSURL(string:"https://spajam-funkey.herokuapp.com/add")!)
        
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        //Note : Add the corresponding "Content-Type" and "Accept" header. In this example I had used the application/json.
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(parameters, options: [])
        
        let task = session.dataTaskWithRequest(request) { data, response, error in
            guard data != nil else {
                print("no data found: \(error)")
                return
            }
            
            do {
                if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
                    print("Response: \(json)")
                    self.myTextField.text = ""
                } else {
                    let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)// No error thrown, but not NSDictionary
                    print("Error could not parse JSON: \(jsonStr)")
                }
            } catch let parseError {
                print(parseError)// Log the error thrown by `JSONObjectWithData`
                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("Error could not parse JSON: '\(jsonStr)'")
            }
        }
        
        task.resume()

        
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
