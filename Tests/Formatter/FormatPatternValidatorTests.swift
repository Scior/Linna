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
        guard let _ = try? actual.get() else {
            return XCTFail("Validation failed")
        }
    }
    
    func testValidateShouldFailWithInvalidParamName() {
        let pattern = "%d %hoge aaa"
        let actual = validator.validate(for: pattern)
        switch actual {
        case .success:
            XCTFail("Validation passed")
        case .failure(let error):
            XCTAssert(error.localizedDescription.contains("parameter"))
            switch error {
            case .illegalParameter:
                break
            default:
                XCTFail("Error not matched")
            }
        }
    }
    
    func testValidateShouldFailWithInvalidCharacters() {
        let pattern = "%d %%aaa"
        let actual = validator.validate(for: pattern)
        switch actual {
        case .success:
            XCTFail("Validation passed")
        case .failure(let error):
            XCTAssert(error.localizedDescription.contains("characters"))
            switch error {
            case .illegalCharacters(let characters):
                XCTAssertEqual(characters, "%%")
            default:
                XCTFail("Error not matched")
            }
        }
    }

}
