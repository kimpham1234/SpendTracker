//
//  Month.swift
//  SpendTracker
//
//  Created by Kim Pham on 8/30/16.
//  Copyright © 2016 BooBoo. All rights reserved.
//

import UIKit

class Month{
    var total:Double
    var name: String
    var days: [Day]
    
    init?(name:String){
        self.total = 0
        self.name = name
        self.days = [Day]()
    }
    
    func addDay(day: Day){
        days.append(day)
        total += day.total
    }
    
    func resetTotal(){
        total = 0
        for day in days{
            total += day.total
        }
    }
    
}

