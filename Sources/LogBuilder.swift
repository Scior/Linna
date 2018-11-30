//
//  LogBuilder.swift
//  Linna
//
//  Created by Suita Fujino on 2018/11/12.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

/**
 The class for building a log string.
 */
class LogBuilder {
    
    // MARK: - Properties
    
    let logFormatter: LogFormatter
    let dateFormatter: DateFormatter
    
    // MARK: - Lifecycle
    
    init(logFormatter: LogFormatter, dateFormatter: DateFormatter) {
        self.logFormatter = logFormatter
        self.dateFormatter = dateFormatter
    }
    
    // MARK: - Methods
    
    /**
     Concatenates the information for the log and returns the result `String`.
     
     - Parameters:
       - objects: Main contents for logging.
       - caller: A caller of logger.
     */
    func build(objects: [Any], level: Linna.LogLevel, tags: [String] = [], caller: Caller) -> String? {
        let dateTime = dateFormatter.string(from: Date())
        
        return logFormatter.format(from: LogContents(date: dateTime, level: level, objects: objects, caller: caller))
    }
}
