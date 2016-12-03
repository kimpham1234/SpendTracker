//
//  Spend.swift
//  SpendTracker
//
//  Created by Kim Pham on 8/13/16.
//  Copyright © 2016 BooBoo. All rights reserved.
//

import UIKit

class Spend: NSObject, NSCoding {
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("spends")
    
    
    
    //MARK: properties
    var item: String
    var price: Double
    var image: UIImage?
    var needed: Bool
    
    //MARK: Types
    struct PropertyKey{
        static let itemKey = "item"
        static let priceKey = "price"
        static let imageKey = "image"
        static let neededKey = "needed"
    }
    
    //MARK:initialization
    init?(item: String, price: Double, image:UIImage?, needed: Bool){
        self.item = item
        self.price = price
        self.image = image
        self.needed = needed
        
        super.init()
        
        if item.isEmpty || price <= 0{
            return nil
        }
    }
    
    //MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(item, forKey:  PropertyKey.itemKey)
        aCoder.encodeObject(image, forKey: PropertyKey.imageKey)
        aCoder.encodeDouble(price, forKey: PropertyKey.priceKey)
        aCoder.encodeBool(needed, forKey: PropertyKey.neededKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        let item = aDecoder.decodeObjectForKey(PropertyKey.itemKey) as! String
        let price = aDecoder.decodeDoubleForKey(PropertyKey.priceKey)
        let image = aDecoder.decodeObjectForKey(PropertyKey.imageKey) as! UIImage
        let needed = aDecoder.decodeBoolForKey(PropertyKey.neededKey)
        
        self.init(item: item, price: price, image: image, needed: needed)
        
    }
    
    
    
    
    
    
    
    
    
    
}
