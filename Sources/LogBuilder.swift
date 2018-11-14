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
final class LogBuilder {
    
    // MARK: - Properties
    
    private static let dateFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        formatter.locale = Locale(identifier: "ja_JP")
        
        return formatter
    }()
    
    // MARK: - Lifecycle
    
    private init() {
        // Singleton
    }
    
    // MARK: - Methods
    
    /**
     Concatenates the information for the log and returns the result `String`.
     
     - Parameters:
       - objects: Main contents for logging.
       - caller: A caller of logger.
     */
    static func build(objects: [Any], level: Linna.LogLevel, tags: [String] = [], caller: Caller) -> String {
        let dateTime = dateFormatter.string(from: Date())
        
        return DefaultLogFormatter().format(from: LogContents(date: dateTime, level: level, objects: objects, caller: caller))
    }
}
