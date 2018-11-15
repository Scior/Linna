//
//  CustomizableLogFormatterTests.swift
//  LinnaTests
//
//  Created by Suita Fujino on 2018/11/15.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

@testable import Linna
import XCTest

class CustomizableLogFormatterTests: XCTestCase {
    
    private let formatter = CustomizableLogFormatter(pattern: "%d %obj <%level> #%file:%func:%line#")
    private let contents = LogContents(
        date: "1234-11-22 xx:xx:xx",
        level: .info,
        objects: ["XAXA", "BBXX"],
        caller: Caller(fileName: "HogeFile", functionName: "HogeFunc", lineNumber: 3_333)
    )

    func testFormat() {
        XCTAssertEqual(
            formatter.format(from: contents),
            "\(contents.date) XAXA BBXX <\(contents.level.outputName())> #\(contents.caller.fileName):\(contents.caller.functionName):\(contents.caller.lineNumber)#"
        )
    }

}