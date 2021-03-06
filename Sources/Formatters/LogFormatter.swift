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
    func format(from contents: LogContents) -> String?
}

extension LogFormatter {
    /**
     Constructs `String` output from pattern.
     
     - `%d`: Replaced with a date string.
     - `%obj`: Replaced with objects.
     - `%level`: Replaced with a log level.
     - `%tags`: Replaced with tags.
     - `%file`: Replaced with a file name.
     - `%func`: Replaced with a function name.
     - `%line`: Replaced with a line number.
     
     - Parameters:
       - contents: Contents to output.
       - pattern: Log format pattern with the forwarding rules.
     
     - Returns: `String` The formatted log.
     */
    func format(from contents: LogContents, with pattern: String) -> String? {
        return pattern
            .checkPatternRules()?
            .replaceSafely(of: "%d", with: contents.date)
            .replaceSafely(of: "%obj", with: contents.objects.map({ "\($0)" }).joined(separator: " "))
            .replaceSafely(of: "%level", with: contents.level.outputName())
            .replaceSafely(of: "%tags", with: contents.tags.map({ "#\($0)" }).joined(separator: " "))
            .replaceSafely(of: "%file", with: contents.caller.filePath.getFileName())
            .replaceSafely(of: "%func", with: contents.caller.functionName)
            .replaceSafely(of: "%line", with: String(contents.caller.lineNumber))
            .completeSafeReplacing()
    }
}

fileprivate extension String {
    func checkPatternRules() -> String? {
        return self.contains("%%") ? nil : self
    }
    
    func replaceSafely(of target: String, with replacement: String) -> String {
        return self.replacingOccurrences(of: target, with: "%%" + replacement)
    }
    
    func completeSafeReplacing() -> String {
        return self.replacingOccurrences(of: "%%", with: "")
    }

    /**
     Extracts the file name from the full path.
     
     - Returns: The file name.
     */
    func getFileName() -> String {
        guard let subSequence = self.split(separator: "/").last else { return "" }
        return String(subSequence)
    }
}
