//
//  LinnaTests.swift
//  LinnaTests
//
//  Created by Suita Fujino on 2018/11/12.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import XCTest
@testable import Linna

class LinnaTests: XCTestCase {

    func testHello() {
        Linna.cout("Hello world!", "foo")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
