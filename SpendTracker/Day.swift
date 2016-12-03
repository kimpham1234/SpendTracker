//
//  Day.swift
//  SpendTracker
//
//  Created by Kim Pham on 8/20/16.
//  Copyright © 2016 BooBoo. All rights reserved.
//

import UIKit

class Day: NSObject, NSCoding{
    //MARK: Archiving paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("days")
    
    
    
    //MARK: Types
    struct PropertyKey {
        static let dateKey = "date"
        static let totalKey = "total"
        static let spendingsKey = "spendArray"
    }
    
    
    
    //MARK: Properties
    var date: String
    var spendings: [Spend]
    var total: Double
    
    
    //MARK: initialization
    init(date: String){
        self.spendings = [Spend]()
        self.total = 0
        self.date = date
    }
    
    init?(date:String, total: Double, spends: [Spend]?){
        self.date = date
        self.total = total
        self.spendings = [Spend]()
        if let _ = spends{
            self.spendings += spends!
        }
        
        super.init()
    }
    
    func addSpend(spend: Spend){
        self.spendings += [spend]
        total += spend.price
    }
    
    func resetTotal(){
        total = 0
        for spend in spendings{
            total += spend.price
        }
    }
    
    //MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(date, forKey: PropertyKey.dateKey)
        aCoder.encodeDouble(total, forKey: PropertyKey.totalKey)
        aCoder.encodeObject(spendings, forKey: PropertyKey.spendingsKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let date = aDecoder.decodeObjectForKey(PropertyKey.dateKey) as! String
        let total = aDecoder.decodeDoubleForKey(PropertyKey.totalKey)
        let spendings = aDecoder.decodeObjectForKey(PropertyKey.spendingsKey) as? [Spend]
        
        self.init(date: date, total: total, spends: spendings)
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
