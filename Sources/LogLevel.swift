//
//  LogLevel.swift
//  Linna
//
//  Created by Suita Fujino on 2018/11/12.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

extension Linna {
    /**
     Default log levels.
     */
    enum LogLevel: String, Codable {
        case info, warning, error
        
        func outputName() -> String {
            return self.rawValue.uppercased()
        }
    }
}