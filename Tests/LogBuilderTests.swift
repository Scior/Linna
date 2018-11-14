//
//  LogBuilderTests.swift
//  LinnaTests
//
//  Created by Suita Fujino on 2018/11/14.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

@testable import Linna
import XCTest

class LogBuilderTests: XCTestCase {
    
    private let testObjects = ["HogeMessage"]
    private let testTags = ["HOGE"]
    private let testFileName = "HogeFile"
    private let testFunction = "HogeFunction"
    private let testLine: Int = 1_212

    func testBuild() {
        let actual = LogBuilder.build(
            objects: testObjects,
            tags: testTags,
            caller: Caller(
                fileName: testFileName,
                functionName: testFunction,
                lineNumber: testLine)
        )
        
        let expected = "[\(testTags[0])] [\(testFunction):\(testLine)] \(testObjects[0])"
        
        XCTAssert(actual.contains(expected))
    }

}
