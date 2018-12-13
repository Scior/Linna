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
     Represents output streams.
     */
    public enum OutputStream {
        case console
        case file
    }
    
    /**
     Outputs a log message to the console.
     
     - Parameters:
       - objects: Main contents for logging.
       - streams: The set of output streams.
       - filePath: The file path from which this method is called. Given by default.
       - functionName: The function name from which this method is called. Given by default.
       - lineNumber: The number of line from which this method is called. Given by default.
     */
    public static func out(_ objects: Any..., with streams: Set<OutputStream>? = nil, filePath: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        guard let message = buildLogMessage(
            objects,
            filePath: filePath,
            functionName: functionName,
            lineNumber: lineNumber
        ) else { return }
        
        for stream in streams ?? outputStreams {
            switch stream {
            case .console:
                consoleStream.out(message: message)
            case .file:
                localFileStream?.out(message: message)
            }
        }
    }
    
    /**
     Outputs a log message to the console.
     
     - Parameters:
       - objects: Main contents for logging.
       - filePath: The file path from which this method is called. Given by default.
       - functionName: The function name from which this method is called. Given by default.
       - lineNumber: The number of line from which this method is called. Given by default.
     */
    public static func cout(_ objects: Any..., filePath: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        guard let message = buildLogMessage(
            objects,
            filePath: filePath,
            functionName: functionName,
            lineNumber: lineNumber
        ) else { return }
        
        consoleStream.out(message: message)
    }
    
    /**
     Outputs a log message to the file.
     
     - Parameters:
       - objects: Main contents for logging.
       - filePath: The file path from which this method is called. Given by default.
       - functionName: The function name from which this method is called. Given by default.
       - lineNumber: The number of line from which this method is called. Given by default.
     */
    public static func fout(_ objects: Any..., filePath: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        #if DEBUG
        if let localFileStream = localFileStream {
            guard let message = buildLogMessage(
                objects,
                filePath: filePath,
                functionName: functionName,
                lineNumber: lineNumber
            ) else { return }
            
            localFileStream.out(message: message)
        } else {
            iPrint(message: "File stream is not ready. Log messages for the file stream will be discarded.")
        }
        #endif
    }
    
    /**
     Outputs a log message with the explicit stream.
     
     - Parameters:
       - objects: Main contents for logging.
       - filePath: The file path from which this method is called. Given by default.
       - functionName: The function name from which this method is called. Given by default.
       - lineNumber: The number of line from which this method is called. Given by default.
     
     - Returns:
       - The combined log message.
     */
    private static func buildLogMessage(_ objects: [Any], filePath: String = #file, functionName: String = #function, lineNumber: Int = #line) -> String? {
        // TODO: Make settable
        let logLevel = LogLevel.info.outputName()
        return logBuilder.build(
            objects: objects,
            level: .info,
            tags: [logLevel],
            caller: Caller(fileName: filePath.getFileName(), functionName: functionName, lineNumber: lineNumber)
        )
    }
}

fileprivate extension String {
    /**
     Extracts the file name from the full path.
     
     - Returns: The file name.
     */
    func getFileName() -> String {
        guard let subSequence = self.split(separator: "/").last else { return "" }
        return String(subSequence)
    }
}
