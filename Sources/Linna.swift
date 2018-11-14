//
//  Linna.swift
//  Linna
//
//  Created by Suita Fujino on 2018/11/12.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import Foundation

/**
 The main class for Linna contains logging functions.
 */
final class Linna {
    
    // MARK: - Properties
    
    static let logBuilder = LogBuilder()
    
    // MARK: - Lifecycle
    
    private init() {
        // Singleton
    }
}
