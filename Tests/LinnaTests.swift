//
//  LinnaTests.swift
//  LinnaTests
//
//  Created by Suita Fujino on 2018/11/12.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

@testable import Linna
import XCTest

class LinnaTests: XCTestCase {
    
    private let testPattern = "%d HOGE Fuga"
    
    func testSetPattern() {
        Linna.setPattern(pattern: testPattern)
        XCTAssertEqual(testPattern, (Linna.logBuilder.logFormatter as? CustomizableLogFormatter)?.pattern)
    }

}
