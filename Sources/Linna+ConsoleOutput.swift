//
//  Linna+ConsoleOutput.swift
//  Linna
//
//  Created by Suita Fujino on 2018/11/12.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

extension Linna {
    static func cout(_ objects: Any..., fileName: String = #file, function: String = #function, line: UInt = #line) {
        let logLevel = LogLevel.info.outputName()
        let output = LogBuilder.build(objects: objects, tags: [logLevel], fileName: fileName, function: function, line: line)
        print(output)
    }
}
