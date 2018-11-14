//
//  LogFormatterTests.swift
//  LinnaTests
//
//  Created by Suita Fujino on 2018/11/14.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

@testable import Linna
import XCTest

class LogFormatterTests: XCTestCase {
    
    private let formatter = DefaultLogFormatter()
    private let contents = LogContents(
        date: "1234-11-22 xx:xx:xx",
        level: .info,
        objects: ["XAXA", "BBXX"],
        caller: Caller(fileName: "HogeFile", functionName: "HogeFunc", lineNumber: 3_333)
    )

    func testFormatWithPattern() {
        XCTAssertEqual(
            formatter.format(from: contents, with: "%d %obj <%level> #%file:%func:%line#"),
            "\(contents.date) XAXA BBXX <\(contents.level.outputName())> #\(contents.caller.fileName):\(contents.caller.functionName):\(contents.caller.lineNumber)#")
        
    }

}
