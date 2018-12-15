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
    private let contents1 = LogContents(
        date: "1234-11-22 xx:xx:xx",
        level: .info,
        objects: ["XAXA", "BBXX"],
        caller: Caller(filePath: "HogeFile", functionName: "HogeFunc", lineNumber: 3_333)
    )
    private let contents2 = LogContents(
        date: "2018-01-01 00:00:00",
        level: .error,
        objects: ["Fuga"],
        caller: Caller(filePath: "FugaFile", functionName: "FugaFunc", lineNumber: 12)
    )

    func testFormatWithPattern1() {
        XCTAssertEqual(
            formatter.format(from: contents1, with: "%d %obj <%level> #%file:%func:%line#"),
            "\(contents1.date) XAXA BBXX <\(contents1.level.outputName())> #\(contents1.caller.filePath):\(contents1.caller.functionName):\(contents1.caller.lineNumber)#")
        
    }
    
    func testFormatWithPattern2() {
        XCTAssertEqual(
            formatter.format(from: contents2, with: "%d %obj [%level] #%file::%func:%line#"),
            "\(contents2.date) Fuga [\(contents2.level.outputName())] #\(contents2.caller.filePath)::\(contents2.caller.functionName):\(contents2.caller.lineNumber)#")
        
    }

}
