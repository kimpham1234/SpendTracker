//
//  SpendTrackerTests.swift
//  SpendTrackerTests
//
//  Created by Kim Pham on 8/8/16.
//  Copyright © 2016 BooBoo. All rights reserved.
//

import XCTest
@testable import SpendTracker

class SpendTrackerTests: XCTestCase {
    
    func testMealInitialization() {
        
        let testItem = Spend(item: "chocopie", price: 2.50, image: nil, needed: true)
        XCTAssertNotNil(testItem)
        

        let noNameItem = Spend(item: "", price: 2.50, image: nil, needed: true)
        XCTAssertNil(noNameItem)
        
        let noPriceItem = Spend(item: "chocopie", price: -1.2, image: nil, needed: true)
        XCTAssertNil(noPriceItem)
    }
    
}
