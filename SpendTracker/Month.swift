//
//  Month.swift
//  SpendTracker
//
//  Created by Kim Pham on 8/30/16.
//  Copyright © 2016 BooBoo. All rights reserved.
//

import UIKit

class Month:NSObject, NSCoding{
    //MARK: Archiving paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("months")
    

    //MARK: Type
    struct Property {
       static let totalKey = "total"
       static let nameKey = "name"
       static let daysKey = "dayArray"
    }
    
    //MARK: Properties
    var total:Double
    var name: String
    var days: [Day]
    
    //Initializer
    init?(name:String){
        self.total = 0
        self.name = name
        self.days = [Day]()
    }
    
    init?(name:String, total:Double, day: [Day]?){
        self.name = name
        self.total = total
        self.days = [Day]()
        if let _ = day{
            self.days += day!
        }
        
        super.init()
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
    
    //MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: Property.nameKey)
        aCoder.encodeDouble(total, forKey: Property.totalKey)
        aCoder.encodeObject(days, forKey: Property.daysKey)
        
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(Property.nameKey) as! String
        let total = aDecoder.decodeDoubleForKey(Property.totalKey)
        let days = aDecoder.decodeObjectForKey(Property.daysKey) as? [Day]
        
        self.init(name:name, total: total, day: days)
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
}

