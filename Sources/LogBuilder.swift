//
//  LogBuilder.swift
//  Linna
//
//  Created by Suita Fujino on 2018/11/12.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

final class LogBuilder {
    
    // - MARK: Properties
    
    private static let dateFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        formatter.locale = Locale(identifier: "ja_JP")
        
        return formatter
    }()
    
    // - MARK: Lifecycle
    
    private init() {
        // Singleton
    }
    
    // - MARK: Methods
    
    static func build(objects: Any..., tags: [String] = [], fileName: String = #file, function: String = #function, line: UInt = #line) -> String {
        let dateTime = dateFormatter.string(from: Date())
        
        var output = [dateTime]
        output += tags.map { "[\($0)]" }
        output.append("[\(function):\(line)]")
        output += objects.map { "\($0)" }
        
        return output.joined(separator: " ")
    }
}
