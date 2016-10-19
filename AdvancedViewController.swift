//
//  AdvancedViewController.swift
//  RPrepSearch
//
//  Created by Nidhi on 12/17/15.
//  Copyright © 2015 Nidhi. All rights reserved.
//

import UIKit

class AdvancedViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerViewPriceRange: UIPickerView!
   
    @IBOutlet weak var pickerViewGender: UIPickerView!
    @IBOutlet weak var pickerViewGrade: UIPickerView!
  var pickerDataSourcePrice = ["$5,000-$10,000", "$10,000-$15,000", "$15,000-$20,000", "$20,000-$25,000", "$25,000-$30,000", "$30,000-$35,000", "$35,000-$40,000", "$40,000+"]
    
    var pickerDataSourceGender = [ "Both", "All Girls", "All Boys"]
    
    var pickerDataSourceGrade = ["Pre-K-12th", "K-12th", "K-8th", "7th-12th", "9th-12th", "K-6th"]
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.pickerViewPriceRange.dataSource = self;
        self.pickerViewPriceRange.delegate = self;
        
        self.pickerViewGender.dataSource = self;
        self.pickerViewGender.delegate = self;
        
        self.pickerViewGrade.dataSource = self;
        self.pickerViewGrade.delegate = self;
        
        
    }
    
    func numberOf

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSourcePrice.count;
        //what's the count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerDataSourcePrice[row]
        
        //what the user picks
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
