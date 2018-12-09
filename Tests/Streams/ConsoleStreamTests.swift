//
//  ConsoleStreamTests.swift
//  LinnaTests
//
//  Created by Suita Fujino on 2018/11/16.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

@testable import Linna
import XCTest

class ConsoleStreamTests: XCTestCase {

    // Empty test for the console out
    func testOut() {
        let stream = ConsoleStream()
        stream.out(message: "aaa")
    }

}
