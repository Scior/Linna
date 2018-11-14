//
//  Linna+ConsoleOutput.swift
//  Linna
//
//  Created by Suita Fujino on 2018/11/12.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

/**
 The extension for console output.
 */
extension Linna {
    /**
     Outputs a log to the console.
     
     - Parameters:
       - objects: Main contents for logging.
       - fileName: The file name from which this method is called. Given by default.
       - function: The function name from which this method is called. Given by default.
       - line: The number of line from which this method is called. Given by default.
     */
    static func cout(_ objects: Any..., fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        let logLevel = LogLevel.info.outputName()
        let output = LogBuilder.build(
            objects: objects,
            tags: [logLevel],
            caller: Caller(fileName: fileName, functionName: functionName, lineNumber: lineNumber)
        )
        print(output)
    }
}
