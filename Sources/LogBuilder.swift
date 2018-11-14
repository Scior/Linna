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
    
    private let dateFormatter: DateFormatter
    
    // MARK: - Lifecycle
    
    // TODO: Remove a default argument
    init(formatter: DateFormatter? = nil) {
        if let formatter = formatter {
            dateFormatter = formatter
        } else {
            dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .medium
            dateFormatter.locale = Locale(identifier: "ja_JP")
        }
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
        
        return DefaultLogFormatter().format(from: LogContents(date: dateTime, level: level, objects: objects, caller: caller))
    }
}
