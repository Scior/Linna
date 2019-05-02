//
//  DefaultLogFormatter.swift
//  Linna
//
//  Created by Suita Fujino on 2018/11/14.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

/**
 The default log formatter for Linna.
 */
public class DefaultLogFormatter: LogFormatter {
    
    // MARK: - Constants
    
    /// Represents log format patterns.
    public enum Pattern {
        case detailed
        case normal
        case short
        case custom(String)
        
        var prereplaced: String {
            switch self {
            case .detailed:
                return "%d [%level] [%file::%func:%line] %obj %tags"
            case .normal:
                return "%d [%level] %obj %tags"
            case .short:
                return "%d %obj %tags"
            case .custom(let value):
                return value
            }
        }
    }
    
    // MARK: - Properties
    
    /// Selected log format pattern.
    let pattern: Pattern
    
    // MARK: - Methods
    
    /**
     Initializer.
     
     - Parameters:
       - pattern: A log format pattern to select.
     */
    public init(pattern: Pattern) {
        self.pattern = pattern
    }
    
    // (Inherit doc.)
    func format(from contents: LogContents) -> String? {
        return format(from: contents, with: pattern.prereplaced)
    }
}
