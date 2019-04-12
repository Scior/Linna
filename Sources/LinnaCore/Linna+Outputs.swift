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
       - tags: Tags used to classify log.
       - streams: The set of output streams.
       - filePath: The file path from which this method is called. Given by default.
       - functionName: The function name from which this method is called. Given by default.
       - lineNumber: The number of line from which this method is called. Given by default.
     */
    public func out(_ objects: Any..., level: LogLevel = .info, tags: Set<String> = Set(), with streams: Set<OutputStream>? = nil, filePath: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        let caller = Caller(filePath: filePath, functionName: functionName, lineNumber: lineNumber)
        guard let message = buildLogMessage(objects, level: level, tags: tags, caller: caller) else { return }
        
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
       - level: The log level which describes severtiy.
       - tags: Tags used to classify log.
       - filePath: The file path from which this method is called. Given by default.
       - functionName: The function name from which this method is called. Given by default.
       - lineNumber: The number of line from which this method is called. Given by default.
     */
    public func cout(_ objects: Any..., level: LogLevel = .info, tags: Set<String> = Set(), filePath: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        let caller = Caller(filePath: filePath, functionName: functionName, lineNumber: lineNumber)
        guard let message = buildLogMessage(objects, level: level, tags: tags, caller: caller) else { return }
        
        consoleStream.out(message: message)
    }
    
    /**
     Outputs a log message to the file.
     
     - Parameters:
       - objects: Main contents for logging.
       - level: The log level which describes severtiy.
       - tags: Tags used to classify log.
       - filePath: The file path from which this method is called. Given by default.
       - functionName: The function name from which this method is called. Given by default.
       - lineNumber: The number of line from which this method is called. Given by default.
     */
    public func fout(_ objects: Any..., level: LogLevel = .info, tags: Set<String> = Set(), filePath: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        #if DEBUG
        if let localFileStream = localFileStream {
            let caller = Caller(filePath: filePath, functionName: functionName, lineNumber: lineNumber)
            guard let message = buildLogMessage(objects, level: level, tags: tags, caller: caller) else { return }
            
            localFileStream.out(message: message)
        } else {
            Linna.iPrint(message: "File stream is not ready. Log messages for the file stream will be discarded.")
        }
        #endif
    }
    
    /**
     Outputs a log message with the explicit stream.
     
     - Parameters:
       - objects: Main contents for logging.
       - level: The log level which describes severtiy.
       - tags: Tags used to classify log.
       - caller: The position from which the output function is called.
     
     - Returns:
       - The combined log message.
     */
    private func buildLogMessage(_ objects: [Any], level: LogLevel, tags: Set<String>, caller: Caller) -> String? {
        return logBuilder.build(
            objects: objects,
            level: level,
            tags: tags,
            caller: caller
        )
    }
}
