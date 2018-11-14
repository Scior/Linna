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
    
    private let logBuilder = LogBuilder()

    func testBuild() {
        let actual = logBuilder.build(
            objects: testObjects,
            level: .info,
            tags: testTags,
            caller: Caller(
                fileName: testFileName,
                functionName: testFunction,
                lineNumber: testLine)
        )
        
        let expected = "[INFO] [\(testFileName).\(testFunction):\(testLine)] \(testObjects[0])"
        
        XCTAssert(actual.contains(expected))
    }

}