//
//  Linna+Outputs.swift
//  Linna
//
//  Created by Suita Fujino on 2018/11/12.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

/**
 The extension for outputs.
 */
extension Linna {
    /**
     Outputs a log message to the console.
     
     - Parameters:
       - objects: Main contents for logging.
       - filePath: The file path from which this method is called. Given by default.
       - function: The function name from which this method is called. Given by default.
       - line: The number of line from which this method is called. Given by default.
     */
    public static func cout(_ objects: Any..., filePath: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        output(objects, with: consoleStream, filePath: filePath, functionName: functionName, lineNumber: lineNumber)
    }
    
    /**
     Outputs a log message to the file.
     
     - Parameters:
     - objects: Main contents for logging.
     - filePath: The file path from which this method is called. Given by default.
     - function: The function name from which this method is called. Given by default.
     - line: The number of line from which this method is called. Given by default.
     */
    public static func fout(_ objects: Any..., filePath: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        guard let localFileStream = localFileStream else { return }
        output(objects, with: localFileStream, filePath: filePath, functionName: functionName, lineNumber: lineNumber)
    }
    
    /**
     Outputs a log message with the explicit stream.
     
     - Parameters:
     - objects: Main contents for logging.
     - stream: The output stream confirms to `LinnaStream`.
     - filePath: The file path from which this method is called. Given by default.
     - function: The function name from which this method is called. Given by default.
     - line: The number of line from which this method is called. Given by default.
     */
    public static func output(_ objects: Any..., with stream: LinnaStream, filePath: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        // TODO: Make settable
        let logLevel = LogLevel.info.outputName()
        guard let output = logBuilder.build(
            objects: objects,
            level: .info,
            tags: [logLevel],
            caller: Caller(fileName: filePath.getFileName(), functionName: functionName, lineNumber: lineNumber)
        ) else { return }
        
        stream.out(message: output)
    }
}

fileprivate extension String {
    func getFileName() -> String {
        guard let subSequence = self.split(separator: "/").last else { return "" }
        return String(subSequence)
    }
}
