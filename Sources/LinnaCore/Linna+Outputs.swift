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
       - level: The log level which describes severtiy.
       - streams: The set of output streams.
       - filePath: The file path from which this method is called. Given by default.
       - functionName: The function name from which this method is called. Given by default.
       - lineNumber: The number of line from which this method is called. Given by default.
     */
    public static func out(_ objects: Any..., level: LogLevel = .info, with streams: Set<OutputStream>? = nil, filePath: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        let caller = Caller(filePath: filePath, functionName: functionName, lineNumber: lineNumber)
        guard let message = buildLogMessage(objects, level: level, caller: caller) else { return }
        
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
    public static func cout(_ objects: Any..., level: LogLevel = .info, filePath: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        let caller = Caller(filePath: filePath, functionName: functionName, lineNumber: lineNumber)
        guard let message = buildLogMessage(objects, level: level, caller: caller) else { return }
        
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
    public static func fout(_ objects: Any..., level: LogLevel = .info, filePath: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        #if DEBUG
        if let localFileStream = localFileStream {
            let caller = Caller(filePath: filePath, functionName: functionName, lineNumber: lineNumber)
            guard let message = buildLogMessage(objects, level: level, caller: caller) else { return }
            
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
       - level: The log level which describes severtiy.
       - caller: The position from which the output function is called.
     
     - Returns:
       - The combined log message.
     */
    private static func buildLogMessage(_ objects: [Any], level: LogLevel, caller: Caller) -> String? {
        return logBuilder.build(
            objects: objects,
            level: level,
            tags: [level.outputName()],
            caller: caller
        )
    }
}
