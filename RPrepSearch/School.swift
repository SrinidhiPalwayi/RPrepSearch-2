//
//  School.swift
//  pRePSearchData
//
//  Created by lake on 12/8/15.
//  Copyright © 2015 Lake. All rights reserved.
//

import UIKit

class School: NSObject
{
    var name = ""
    var street = ""
    var town = ""
    var zip = ""
    var phone = ""
    var email = ""
    var web = ""
    var gradeMin = 0
    var gradeMax = 0
    var coed = 0
    var religious = false
    var boarding = 0
    var price = 20000
    
    init(name: String,
        street: String,
        town: String,
        zip: String,
        phone: String,
        email: String,
        web: String,
        gradeMin: Int,
        gradeMax: Int,
        coed: Int,
        religious: Bool,
        boarding: Int,
        price: Int)
    {
        self.name = name
        self.street = street
        self.town = town
        self.zip = zip
        self.phone = phone
        self.email = email
        self.web = web
        self.gradeMin = gradeMin
        self.gradeMax = gradeMax
        self.coed = coed
        self.religious =  religious
        self.boarding = boarding
        self.price = price
    }

}
