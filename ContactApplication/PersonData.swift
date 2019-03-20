//
//  PersonData.swift
//  ContactApplication
//
//  Created by SHILEI CUI on 3/19/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import Foundation

class PersonData : NSObject{
    var name : String?
    var phone : String?
    var Email : String?
    var address : String?
    var company : String?
    init(n: String,p: String,e: String, a: String, c: String){
        name = n
        phone = p
        Email = e
        address = a
        company = c
    }
}

var pdata : [PersonData] = [PersonData(n: "Alvin", p: "345435", e: "al@gmail.com", a: "New York State", c: "rjt"), PersonData(n: "Shilei", p: "533453", e: "sl@gmail.com", a: "Chichgo", c: "apolis"), PersonData(n: "Dustin", p: "6756776", e: "ds@gmail.com",a: "Texas", c: "Google")]

