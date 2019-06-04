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
    private let testTags: Set<String> = ["HOGE"]
    private let testFileName = "HogeFile"
    private let testFunction = "HogeFunction"
    private let testLine: Int = 1_212
    
    private let logBuilder = LogBuilder(
        logFormatter: DefaultLogFormatter(pattern: .detailed),
        dateFormatter: DefaultDateFormatter().formatter
    )
    
    // MARK: - Test cases

    func testBuild() {
        guard let actual = logBuilder.build(
            objects: testObjects,
            level: .info,
            tags: testTags,
            caller: Caller(
                filePath: testFileName,
                functionName: testFunction,
                lineNumber: testLine)
        ) else {
            XCTFail("Unexpected nil.")
            return
        }
        
        let expected = "[INFO] [\(testFileName)::\(testFunction):\(testLine)] \(testObjects[0])"
        
        XCTAssert(actual.contains(expected))
    }

}
