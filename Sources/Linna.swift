//
//  Linna.swift
//  Linna
//
//  Created by Suita Fujino on 2018/11/12.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

/**
 The main class for Linna contains logging functions.
 */
public final class Linna {

    // MARK: - Properties
    
    /// The shared instance of `LogBuilder`, which constructs the log outputs.
    static var logBuilder = LogBuilder(
        logFormatter: DefaultLogFormatter(),
        dateFormatter: DefaultDateFormatter().formatter
    )
    
    // MARK: - Lifecycle
    
    private init() {
        // Singleton
    }
    
    // MARK: - Methods
    
    /**
     Set the format pattern for outputting logs.
     
     - Parameters:
       - pattern: The format pattern to set.
     */
    public static func setPattern(with pattern: String) {
        logBuilder = LogBuilder(
            logFormatter: CustomizableLogFormatter(pattern: pattern),
            dateFormatter: DefaultDateFormatter().formatter
        )
    }
}
