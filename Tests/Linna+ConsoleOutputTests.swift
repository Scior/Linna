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
    
    class ConsoleStreamMock: LinnaStream {
        var outputResult: String?
        
        func out(message: String) {
            outputResult = message
        }
    }

    override func setUp() {
        super.setUp()
        // NOTE: To show the default output, comment out the following line.
        Linna.logBuilder = LogBuilderMock(
            logFormatter: DefaultLogFormatter(),
            dateFormatter: DefaultDateFormatter().formatter
        )
        Linna.consoleStream = ConsoleStreamMock()
    }

    func testCout() {
        let testMessage = "aaa"
        Linna.cout(testMessage)
        XCTAssertEqual("HOGE", (Linna.consoleStream as? ConsoleStreamMock)?.outputResult)
    }
    
}
