//
//  AddKeywordViewController.swift
//  VoiceBot
//
//  Created by Kudo Takuya on 2016/07/02.
//  Copyright © 2016年 Kudo Takuya. All rights reserved.
//

import UIKit

class AddKeywordViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var selectpicker: UIPickerView!
    var categoryArr: NSArray = ["電気をつける","電気の色をピンクに変える","電気の色を青に変える","電気の色を白に変える","電気の色を黄色に変える",]
    override func viewDidLoad() {
        super.viewDidLoad()
        selectpicker.dataSource = self
        selectpicker.delegate = self
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
