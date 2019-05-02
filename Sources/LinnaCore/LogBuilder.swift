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
public class LogBuilder {
    
    // MARK: - Properties
    
    /// The static instance of the default log builder.
    public static let `default` = LogBuilder(
        logFormatter: DefaultLogFormatter(pattern: .normal),
        dateFormatter: DefaultDateFormatter().formatter
    )
    
    /// A log formatter to build log messages.
    private(set) var logFormatter: LogFormatter
    /// A date formatter to build formatted date strings.
    let dateFormatter: DateFormatter
    
    // MARK: - Lifecycle
    
    /**
     Initializer.
     
     - Parameters:
       - logFormatter: The formatter to build log messages.
       - dateFormatter: The formatter to build formatted date strings.
     */
    init(logFormatter: LogFormatter, dateFormatter: DateFormatter) {
        self.logFormatter = logFormatter
        self.dateFormatter = dateFormatter
    }
    
    // MARK: - Methods
    
    /**
     Concatenates the information for the log and returns the result `String`.
     
     - Parameters:
       - objects: Main contents for logging.
       - tags: Tags of the log.
       - caller: A caller of logger.
     */
    func build(objects: [Any], level: Linna.LogLevel, tags: Set<String>, caller: Caller) -> String? {
        let dateTime = dateFormatter.string(from: Date())
        
        return logFormatter.format(from: LogContents(date: dateTime, level: level, objects: objects, tags: tags, caller: caller))
    }
    
    /**
     Sets new log formatter with the given pattern.
     
     - Parameters:
       - pattern: The format pattern to set.
    */
    func setFormatPattern(with pattern: String) {
        logFormatter = DefaultLogFormatter(pattern: .custom(pattern))
    }
}
