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
    private static let testMessage = "HOGEmessage1001"
    
    class LogBuilderMock: LogBuilder {
        override func build(objects: [Any], level: Linna.LogLevel, tags: [String], caller: Caller) -> String {
            return LinnaOutputsTests.testMessage
        }
    }
    
    class ConsoleStreamMock: LinnaStream {
        var outputResult: String?
        
        func out(message: String) {
            outputResult = message
        }
    }
    
    lazy var localFileStreamMock: LocalFileStream = {
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
    }
    
    func testOut() {
        removeTestLogFile()
        Linna.localFileStream = localFileStreamMock
        
        Linna.out("aaa")
        Linna.out("uuu")
        
        guard let data = FileManager.default.contents(atPath: testFilePath) else {
            XCTFail("Unexpected nil")
            return
        }
        
        XCTAssertEqual(LinnaOutputsTests.testMessage, (Linna.consoleStream as? ConsoleStreamMock)?.outputResult)
        XCTAssertEqual(
            "\(LinnaOutputsTests.testMessage)\n\(LinnaOutputsTests.testMessage)\n",
            String(data: data, encoding: .utf8)
        )
    }

    func testCout() {
        Linna.cout("aaa")
        
        XCTAssertEqual(LinnaOutputsTests.testMessage, (Linna.consoleStream as? ConsoleStreamMock)?.outputResult)
    }
    
    func testFout() {
        removeTestLogFile()
        Linna.localFileStream = localFileStreamMock
        Linna.fout("uuu")
        Linna.fout("uuu")
        guard let data = FileManager.default.contents(atPath: testFilePath) else {
            XCTFail("Unexpected nil")
            return
        }
        
        XCTAssertEqual(
            "\(LinnaOutputsTests.testMessage)\n\(LinnaOutputsTests.testMessage)\n",
            String(data: data, encoding: .utf8)
        )
    }
    
    func testFoutWithNilFileStream() {
        removeTestLogFile()
        Linna.localFileStream = nil
        Linna.fout("uuu")
        
        XCTAssertFalse(FileManager.default.fileExists(atPath: testFilePath))
    }
    
    private func removeTestLogFile() {
        let _ = try? FileManager.default.removeItem(atPath: testFilePath)
    }
    
}
