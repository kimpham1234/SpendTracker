//
//  Day.swift
//  SpendTracker
//
//  Created by Kim Pham on 8/20/16.
//  Copyright © 2016 BooBoo. All rights reserved.
//

import UIKit

class Day{
    var date: String
    var spendings: [Spend]
    var total: Double
    
    init(date: String){
        self.spendings = [Spend]()
        self.total = 0
        self.date = date
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
    
}
