//
//  LogFormatter.swift
//  Linna
//
//  Created by Suita Fujino on 2018/11/14.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

/**
 The formatter to construct log.
 */
protocol LogFormatter {
    /**
     Constructs formatted string from `LogContents`.
     
     - Parameters:
       - contents: Contents to output.
     
     - Returns: `String` The formatted log.
     */
    func format(from contents: LogContents) -> String
}

extension LogFormatter {
    /**
     Constructs `String` output from pattern.
     
     - `%d`: Replaced with a date string.
     - `%obj`: Replaced with objects.
     - `%file`: Replaced with a file name.
     - `%func`: Replaced with a function name.
     - `%line`: Replaced with a line number.
     
     - Parameters:
       - contents: Contents to output.
       - pattern: Log format pattern with the forwarding rules.
     
     - Returns: `String` The formatted log.
     */
    func format(from contents: LogContents, with pattern: String) -> String {
        return pattern
            .replaceSafely(of: "%d", with: contents.date)
            .replaceSafely(of: "%obj", with: contents.objects.map({ "\($0)" }).joined(separator: " "))
            .replaceSafely(of: "%level", with: contents.level.outputName())
            .replaceSafely(of: "%file", with: contents.caller.fileName)
            .replaceSafely(of: "%func", with: contents.caller.functionName)
            .replaceSafely(of: "%line", with: String(contents.caller.lineNumber))
            .completeSafeReplacing()
    }
}

fileprivate extension String {
    func replaceSafely(of target: String, with replacement: String) -> String {
        return self.replacingOccurrences(of: target, with: "%%" + replacement)
    }
    
    func completeSafeReplacing() -> String {
        return self.replacingOccurrences(of: "%%", with: "")
    }
}
