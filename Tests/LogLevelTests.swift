//
//  LogLevelTests.swift
//  LinnaTests
//
//  Created by Suita Fujino on 2018/11/12.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

@testable import Linna
import XCTest

class LogLevelTests: XCTestCase {

    func testLinnaLogLevels_outputName() {
        XCTAssertEqual(Linna.LogLevel.info.outputName(), "INFO")
        XCTAssertEqual(Linna.LogLevel.warning.outputName(), "WARNING")
        XCTAssertEqual(Linna.LogLevel.error.outputName(), "ERROR")
    }

}
