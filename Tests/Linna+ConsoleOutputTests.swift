//
//  Linna+ConsoleOutputTests.swift
//  LinnaTests
//
//  Created by Suita Fujino on 2018/11/14.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

@testable import Linna
import XCTest

class LinnaConsoleOutputTests: XCTestCase {
    
    class LogBuilderMock: LogBuilder {
        override func build(objects: [Any], level: Linna.LogLevel, tags: [String], caller: Caller) -> String {
            return "HOGE"
        }
    }

    override func setUp() {
        super.setUp()
        // NOTE: To show the default output, comment out the following line.
        Linna.logBuilder = LogBuilderMock(
            logFormatter: DefaultLogFormatter(),
            dateFormatter: DefaultDateFormatter().formatter
        )
    }

    func testCout() {
        Linna.cout("aaa")
    }
    
}
