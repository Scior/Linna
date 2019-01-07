//
//  LogContents.swift
//  Linna
//
//  Created by Suita Fujino on 2018/11/14.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

/**
 Contents for the log output.
 */
public struct LogContents {
    
    // MARK: - Properties
    
    let date: String
    let level: Linna.LogLevel
    let objects: [Any]
    let caller: Caller
    
}
