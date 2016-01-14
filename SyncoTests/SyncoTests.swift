//
//  SyncoTests.swift
//  SyncoTests
//
//  Created by asai.yuki on 2016/01/14.
//  Copyright © 2016年 yukiasai. All rights reserved.
//

import XCTest
@testable import Synco

class SyncoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSynchronized() {
        let lock = Lock()
        
        let count = 10000
        let range = 0..<count
        let sum = range.reduce(0) { $0 + $1 }
        var result = 0
        
        range.forEach { index in
            let exp = expectationWithDescription("")
            let priority = { Void -> dispatch_queue_priority_t in
                return random() % 2 == 0 ? DISPATCH_QUEUE_PRIORITY_HIGH : DISPATCH_QUEUE_PRIORITY_LOW
            }()
            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                lock.sync {
                    result += index
                    exp.fulfill()
                }
            }
        }
        
        self.waitForExpectationsWithTimeout(1000) { e in
            if let error = e {
                XCTFail(error.description)
            }
            XCTAssertEqual(result, sum)
        }
    }
    
    func testReturnValue() {
        let lock = Lock()
        
        let string = lock.sync {
            return "string"
        }
        XCTAssertEqual(string, "string")
        
        let int = lock.sync {
            return 1
        }
        XCTAssertEqual(int, 1)
    }
    
}
