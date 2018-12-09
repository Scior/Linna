//
//  LinnaTests.swift
//  LinnaTests
//
//  Created by Suita Fujino on 2018/11/12.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

@testable import Linna
import XCTest

class LinnaTests: XCTestCase {
    
    private let testPattern = "%d HOGE Fuga"
    private let testFilePath = "hoge1234"
    
    func testSetPattern() {
        Linna.setFormatPattern(with: testPattern)
        XCTAssertEqual(testPattern, (Linna.logBuilder.logFormatter as? CustomizableLogFormatter)?.pattern)
    }
    
    func testSetFileOutputPath() {
        Linna.setFileOutputPath(to: testFilePath)
        guard let stream = Linna.localFileStream as? LocalFileStream else {
            XCTFail("Unexpected nil")
            return
        }
        XCTAssertTrue(stream.outputPath.absoluteString.hasSuffix(testFilePath))
    }

}
