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
class DefaultLogFormatter: LogFormatter {
    private static let pattern = "%d [%level] [%file.%func:%line] %obj"
    
    func format(from contents: LogContents) -> String {
        return format(from: contents, with: DefaultLogFormatter.pattern)
    }
}
