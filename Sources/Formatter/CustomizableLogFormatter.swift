//
//  CustomizableLogFormatter.swift
//  Linna
//
//  Created by Suita Fujino on 2018/11/15.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

/**
 Log formatter with a customizable format.
 */
class CustomizableLogFormatter: LogFormatter {

    // MARK: - Properties
    
    let pattern: String
    
    // MARK: - Lifecycle
    
    /**
     Initialize with the log format pattern.
     
     - Parameters:
       - pattern: Log format pattern. See `LogFormatter.format`.
     */
    init(pattern: String) {
        self.pattern = pattern
    }
    
    // MARK: - Methods
    
    func format(from contents: LogContents) -> String? {
        return format(from: contents, with: pattern)
    }
    
}
