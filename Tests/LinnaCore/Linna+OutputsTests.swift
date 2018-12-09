//
//  Linna+OutputsTests.swift
//  LinnaTests
//
//  Created by Suita Fujino on 2018/11/14.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

@testable import Linna
import XCTest

class LinnaOutputsTests: XCTestCase {
    
    private let testFilePath = "hogetaro"
    
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
    
    lazy var localFileStreamMock: LocalFileStream = {
        try! FileManager.default.removeItem(atPath: testFilePath)
        
        guard let stream = LocalFileStream(filePath: testFilePath) else { fatalError() }
        return stream
    }()

    override func setUp() {
        super.setUp()
        // NOTE: To show the default output, comment out the following line.
        Linna.logBuilder = LogBuilderMock(
            logFormatter: DefaultLogFormatter(),
            dateFormatter: DefaultDateFormatter().formatter
        )
        Linna.consoleStream = ConsoleStreamMock()
        Linna.localFileStream = localFileStreamMock
    }

    func testCout() {
        Linna.cout("aaa")
        XCTAssertEqual("HOGE", (Linna.consoleStream as? ConsoleStreamMock)?.outputResult)
    }
    
    func testFout() {
        Linna.fout("uuu")
        guard let data = FileManager.default.contents(atPath: testFilePath) else {
            XCTFail("Unexpected nil")
            return
        }
        XCTAssertEqual("HOGE\n", String(data: data, encoding: .utf8))
    }
    
}
