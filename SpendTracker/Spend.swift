//
//  Spend.swift
//  SpendTracker
//
//  Created by Kim Pham on 8/13/16.
//  Copyright © 2016 BooBoo. All rights reserved.
//

import UIKit

class Spend{
    
    var item: String
    var price: Double
    var image: UIImage?
    var needed: BooleanType
    
    //MARK:initialization
    init?(item: String, price: Double, image:UIImage?, needed: BooleanType){
        self.item = item
        self.price = price
        self.image = image
        self.needed = needed
        
        if item.isEmpty || price <= 0{
            return nil
        }
    }
    
    
    
}
