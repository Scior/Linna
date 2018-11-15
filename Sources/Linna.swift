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
    
    static var logBuilder = LogBuilder(logFormatter: DefaultLogFormatter())
    
    // MARK: - Lifecycle
    
    private init() {
        // Singleton
    }
    
    // MARK: - Methods
    
    public static func setPattern(pattern: String) {
        logBuilder = LogBuilder(logFormatter: CustomizableLogFormatter(pattern: pattern))
    }
}
