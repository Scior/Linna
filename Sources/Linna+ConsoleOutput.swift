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
       - filePath: The file path from which this method is called. Given by default.
       - function: The function name from which this method is called. Given by default.
       - line: The number of line from which this method is called. Given by default.
     */
    public static func cout(_ objects: Any..., filePath: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        let logLevel = LogLevel.info.outputName()
        guard let output = logBuilder.build(
            objects: objects,
            level: .info,
            tags: [logLevel],
            caller: Caller(fileName: filePath.getFileName(), functionName: functionName, lineNumber: lineNumber)
        ) else { return }
        
        print(output)
    }
}

fileprivate extension String {
    func getFileName() -> String {
        guard let subSequence = self.split(separator: "/").last else { return "" }
        return String(subSequence)
    }
}
