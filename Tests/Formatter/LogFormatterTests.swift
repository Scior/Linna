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
    
    private let detailedFormatter = DefaultLogFormatter(pattern: .detailed)
    private let contents1 = LogContents(
        date: "1234-11-22 xx:xx:xx",
        level: .info,
        objects: ["XAXA", "BBXX"],
        tags: Set(),
        caller: Caller(filePath: "HogeFile", functionName: "HogeFunc", lineNumber: 3_333)
    )
    private let contents2 = LogContents(
        date: "2018-01-01 00:00:00",
        level: .error,
        objects: ["Fuga"],
        tags: Set(),
        caller: Caller(filePath: "FugaFile", functionName: "FugaFunc", lineNumber: 12)
    )
    private let contents3 = LogContents(
        date: "2018-12-31 00:00:00",
        level: .info,
        objects: ["HogeFuga"],
        tags: ["ABC", "Jupiter"],
        caller: Caller(filePath: "HogeFugaFile", functionName: "funcfunc", lineNumber: 1222)
    )

    func testFormatWithPattern1() {
        XCTAssertEqual(
            detailedFormatter.format(from: contents1, with: "%d %obj <%level> #%file:%func:%line#"),
            "\(contents1.date) XAXA BBXX <\(contents1.level.outputName())> #\(contents1.caller.filePath):\(contents1.caller.functionName):\(contents1.caller.lineNumber)#"
        )
    }
    
    func testFormatWithPattern2() {
        XCTAssertEqual(
            detailedFormatter.format(from: contents2, with: "%d %obj [%level] #%file::%func:%line#"),
            "\(contents2.date) Fuga [\(contents2.level.outputName())] #\(contents2.caller.filePath)::\(contents2.caller.functionName):\(contents2.caller.lineNumber)#"
        )
    }
    
    func testFormatWithPattern3() {
        XCTAssertEqual(
            detailedFormatter.format(from: contents3),
            "\(contents3.date) [\(contents3.level.outputName())] " +
            "[\(contents3.caller.filePath)::\(contents3.caller.functionName):\(contents3.caller.lineNumber)] \(contents3.objects[0]) " +
            contents3.tags.map({ "#\($0)" }).joined(separator: " ")
        )
    }
    
    private let normalFormatter = DefaultLogFormatter(pattern: .normal)
    
    func testNormalFormatt() {
        XCTAssertEqual(
            normalFormatter.format(from: contents1),
            "\(contents1.date) [\(contents1.level.outputName())] " +
                contents1.objects.map({ "\($0)" }).joined(separator: " ") + " " +
                contents1.tags.map({ "#\($0)" }).joined(separator: " "))
    }
    
    private let customFormatter = DefaultLogFormatter(pattern: .custom("%d %obj <%level> #%file:%func:%line# %tags"))
    
    func testCustomFormat() {
        XCTAssertEqual(
            customFormatter.format(from: contents1),
            "\(contents1.date) XAXA BBXX <\(contents1.level.outputName())> #\(contents1.caller.filePath):\(contents1.caller.functionName):\(contents1.caller.lineNumber)# "
        )
    }

}
