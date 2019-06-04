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
    
    private var linna = Linna()
    
    class LogBuilderMock: LogBuilder {
        override func build(objects: [Any], level: Linna.LogLevel, tags: Set<String>, caller: Caller) -> String {
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
    
    // MARK: - Overrides

    override func setUp() {
        super.setUp()
        
        removeTestLogFile()
        
        linna = Linna(logBuilder: LogBuilderMock(
            logFormatter: DefaultLogFormatter(pattern: .detailed),
            dateFormatter: DefaultDateFormatter().formatter
        ))
        linna.consoleStream = ConsoleStreamMock()
    }
    
    // MARK: - Test cases
    
    func testOut() {
        linna.localFileStream = localFileStreamMock
        
        linna.out("aaa")
        linna.out("uuu")
        
        guard let data = FileManager.default.contents(atPath: testFilePath) else {
            XCTFail("Unexpected nil")
            return
        }
        
        XCTAssertEqual(LinnaOutputsTests.testMessage, (linna.consoleStream as? ConsoleStreamMock)?.outputResult)
        XCTAssertEqual(
            "\(LinnaOutputsTests.testMessage)\n\(LinnaOutputsTests.testMessage)\n",
            String(data: data, encoding: .utf8)
        )
    }
    
    func testTee() {
        let input = "hogeInput"
        let actual = linna.tee(input)
        
        XCTAssertEqual(LinnaOutputsTests.testMessage, (linna.consoleStream as? ConsoleStreamMock)?.outputResult)
        XCTAssertEqual(actual, input)
    }

    func testCout() {
        linna.cout("aaa")
        
        XCTAssertEqual(LinnaOutputsTests.testMessage, (linna.consoleStream as? ConsoleStreamMock)?.outputResult)
    }
    
    func testFout() {
        linna.localFileStream = localFileStreamMock
        linna.fout("uuu")
        linna.fout("uuu")
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
        linna.localFileStream = nil
        linna.fout("uuu")
        
        XCTAssertFalse(FileManager.default.fileExists(atPath: testFilePath))
    }
    
    // MARK: - Utilities
    
    private func removeTestLogFile() {
        let _ = try? FileManager.default.removeItem(atPath: testFilePath)
    }
    
}
