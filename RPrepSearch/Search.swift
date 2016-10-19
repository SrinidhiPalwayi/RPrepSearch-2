//
//  Search.swift
//  Search Engine
//
//  Created by Stephen T on 12/3/15.
//  Copyright © 2015 Stephen T. All rights reserved.
//

import Foundation

class Search{
    
    var coED = 0; //0=coed, 1 = m 2 = f
    var minGrade = -1; //pre k
    var maxGrade = 12; // senior
    var zipCode:NSString = "000000";
    var name:NSString = "Test School";
    var religious = false;
    var minPrice = 0;
    var maxPrice = 30000;
    var schools:NSMutableArray;
    var hits:[Int];
    var boarding = 0;
    var SEARCH_AMOUNT = 7;
    var returning = NSMutableArray();

    
    init(schools: NSMutableArray, searchTerm: School, min: Int, max: Int){
        self.schools = schools;
        self.hits = [Int]();
        coED = searchTerm.coed;
        minGrade = searchTerm.gradeMin;
        maxGrade = searchTerm.gradeMax;
        zipCode = searchTerm.zip;
        name = searchTerm.name;
        religious = searchTerm.religious;
        minPrice = min;
        maxPrice = max;
        boarding = searchTerm.boarding;
    }
    
    
    func within(start: Int, min: Int, max: Int) -> Bool{
        if(start > min && start < max){
            return true;
        }else{
            return false;
        }
    }
    //search terms: name, zip code, price, grade levels, religious affiliation, co-ed
    func advancedSearch() -> NSMutableArray{
        var temp:NSMutableArray;
        
        print("TESTING TESTING");
        for(var i = 0; i < schools.count; i++)
        {
            print("\n")
            let school = schools[i] as! School
            print(school.name)
            print(school.street)
            print(school.town)
            print(school.zip)
            print(school.phone)
            print(school.email)
            print(school.web)
            print(school.gradeMin)
            print(school.gradeMax)
            print(school.coed)
            print(school.religious)
            print(school.boarding)
            print(school.price)
            
            
        }
        
            

        
        for(var i = 0; i < SEARCH_AMOUNT; i++){
            print("filling hits array");
            hits.append(0);
        }
        //name search
        
        /*if(name != nil){
        for(School s : schools){
        //if meet terms, add to temp;
        }
        }else{
        temp = schools;
        }*/
        
        //search
        //temp = schools;
        for(var i = 0; i < SEARCH_AMOUNT; i++)
        {
            print("searching schools");
            print(i);

            var s = schools[i] as! School;
            
            //if criteria 1 -- zipcode
            if(s.zip == zipCode){
                hits[i]++;
            }
            
            //if criteria 2 -- co ed
            if(s.coed == coED){
                hits[i]++;
            }
            
            //if criteria 3 -- religious
            if(s.religious == religious){
                hits[i]++;
            }
            
            //if criteria 4 -- price
            if(within(s.price, min: minPrice, max: maxPrice)){
                hits[i]++;
            }
            
            //if criteria 5 -- boarding
            if(s.boarding == boarding){
                hits[i]++;
            }
            
            //criteria 6 - grade levels
            
            
            //if meet terms, add to temp2
        }
        orderSchools()
        print("======================== \n HITS");
        for(var i = 0; i < SEARCH_AMOUNT; i++){
            print(hits[i]);
        }
        return returning;
    }
    
    func orderSchools(){
        for(var i = 5; i>=0; i--){
            for(var j = 0; j < SEARCH_AMOUNT; j++){
                if(hits[j] == i){
                    returning.addObject(schools[j]);
                }
            }
        }
        
    }
}
