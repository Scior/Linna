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
struct LogContents {
    
    // MARK: - Properties
    
    let date: String
    let level: Linna.LogLevel
    let objects: [Any]
    let tags: Set<String>
    let caller: Caller
    
}
