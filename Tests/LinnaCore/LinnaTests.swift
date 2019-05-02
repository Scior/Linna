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
    
    private let linna = Linna()
    
    func testSetPattern() {
        linna.setFormatPattern(with: testPattern)
        XCTAssertEqual(testPattern, (linna.logBuilder.logFormatter as? DefaultLogFormatter)?.pattern.prereplaced)
    }
    
    func testSetFileOutputPath() {
        linna.setFileOutputPath(to: testFilePath)
        guard let stream = linna.localFileStream as? LocalFileStream else {
            XCTFail("Unexpected nil")
            return
        }
        XCTAssertTrue(stream.outputPath.absoluteString.hasSuffix(testFilePath))
    }

}
