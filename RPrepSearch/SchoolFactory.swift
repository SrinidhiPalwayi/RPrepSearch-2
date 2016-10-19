//
//  SchoolFactory.swift
//  pRePSearchData
//
//  Created by lake on 12/8/15.
//  Copyright © 2015 Lake. All rights reserved.
//

import UIKit

class SchoolFactory: NSObject
{
    private var resultDictionary = NSMutableDictionary();
    private var listOfSchools = NSMutableArray();
    
    
    
    //loadSchoolData is a private helper method
    //this data is loaded from the SchoolData.plist
    private func loadSchoolData()
    {
        // getting path to SchoolData.plist
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        
        let documentsDirectory = paths[0] as! String
        
        let doc = NSURL(string: documentsDirectory)
        let path = doc!.URLByAppendingPathComponent("SchoolData.plist")
        
        let stringPath = "\(path)" //this is the file path as a string
        
        
        //get the file manager to work with our file
        let fileManager = NSFileManager.defaultManager()
        
       
        
        //check if file exists
        if(!fileManager.fileExistsAtPath(stringPath))
        {
            // If it doesn't, copy it from the default file in the Bundle
            if let bundlePath = NSBundle.mainBundle().pathForResource("SchoolData", ofType: "plist")
            {
                 self.resultDictionary = NSMutableDictionary(contentsOfFile: bundlePath)!
                print(self.resultDictionary)
                //fileManager.copyItemAtPath(bundlePath, toPath: path)
                
            }
            else
            {
                print("SchoolData.plist not found. Please, make sure it is part of the bundle.")
            }
        }
        else
        {
            print("SchoolData.plist already exits at path.")
            // use this to delete file from documents directory
            //fileManager.removeItemAtPath(path, error: nil)
        }
        
    }//End load school data
    
    
    //get the list of schools after loading the data
    //this is an algorithm to populate the listOfSchools array
    func getListOfSchools() -> NSMutableArray
    {
        
        
        //Load the school data from the pList first
        loadSchoolData()
        
        
        //get the root dictionary that contains an array of schools
        let  arrayOfSchools = resultDictionary.objectForKey("SchoolObjectList")
        
        //parse the dictionary to extract the data
        //NOTE: arrayOfSchools!.count should be used but we
        //do not have all the schools in the list as yet
        for(var i = 0; i < 9; i++)
        {
            if(arrayOfSchools![i] != nil)
            {
                
                
              
                let school = arrayOfSchools![i] as! NSDictionary
            
                
                
                    //extract each piece of data
                    let name = school.objectForKey("schoolName")
                    let street = school.objectForKey("street")
                    let town = school.objectForKey("town")
                    let zip = school.objectForKey("zip")
                    let phone = school.objectForKey("phone")
                    let email = school.objectForKey("email")
                    let web = school.objectForKey("web")
                    let gradeMin = school.objectForKey("gradeMin")
                    let gradeMax = school.objectForKey("gradeMax")
                    let coed = school.objectForKey("coed")
                    let religious = school.objectForKey("religious")
                    let boarding = school.objectForKey("boarding")
                    let price = school.objectForKey("price")
                    
                    
                    //create school object
                    let currentSchool = School(name: name as! String, street: street as! String, town: town as! String, zip: zip as! String, phone: phone as! String, email: email as! String, web: web as! String, gradeMin: gradeMin as! Int, gradeMax: gradeMax as! Int, coed: coed as! Int, religious: religious as! Bool, boarding: boarding as! Int, price: price as! Int)
                    
                    //store the school object
                    self.listOfSchools.addObject(currentSchool)
                }
            
            
            
            
        }
        
        
        return self.listOfSchools
    }
    

}
