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
    static func build(objects: [Any], tags: [String] = [], caller: Caller) -> String {
        let dateTime = dateFormatter.string(from: Date())
        
        var output = [dateTime]
        output += tags.map { "[\($0)]" }
        output.append("[\(caller.functionName):\(caller.lineNumber)]")
        output += objects.map { "\($0)" }
        
        return output.joined(separator: " ")
    }
}
