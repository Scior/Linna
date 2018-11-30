//
//  FormatPatternValidatorTests.swift
//  LinnaTests
//
//  Created by Suita Fujino on 2018/12/01.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import XCTest
@testable import Linna

class FormatPatternValidatorTests: XCTestCase {
    
    private let validator = FormatPatternValidator()

    func testValidateShouldSuccess() {
        let pattern = "%d %obj <%level> #%file:%func:%line#"
        let actual = validator.validate(for: pattern)
        XCTAssertTrue(actual.isOk())
    }
    
    func testValidateShouldFailWithInvalidParamName() {
        let pattern = "%d %hoge aaa"
        let actual = validator.validate(for: pattern)
        XCTAssertTrue(actual.isError())
    }
    
    func testValidateShouldFailWithInvalidCharacter() {
        let pattern = "%d %%aaa"
        let actual = validator.validate(for: pattern)
        XCTAssertTrue(actual.isError())
    }

}
