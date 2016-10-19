//
//  SimpleSearch.swift
//  pRePSearchData
//
//  Created by ショーン・カラーク on 12/14/15.
//  Copyright © 2015 Lake. All rights reserved.
//

import UIKit

class SimpleSearch: NSObject
{
    
    func search(terms:String)
    {
        let factory = SchoolFactory()
        let listOfSchools = factory.getListOfSchools()
        
        for(var i=0; i < listOfSchools.count; i++)
        {
            if(listOfSchools[i].name.containsString(terms))
            {
                print(listOfSchools[i].name)
            }
            else
            {
                print("School Not Found")
            }
        }
    }
}
