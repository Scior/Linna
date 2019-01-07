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
    public static var logBuilder = LogBuilder(
        logFormatter: DefaultLogFormatter(),
        dateFormatter: DefaultDateFormatter().formatter
    )

    /// The stream for console outputs.
    public static var consoleStream: LinnaStream = ConsoleStream()
    /// The stream for file outputs.
    public static var localFileStream: LinnaStream?
    /// The streams in use.
    static var outputStreams: Set<OutputStream> = [.console, .file]
    
    // MARK: - Lifecycle
    
    private init() {
        // Singleton
    }
    
    // MARK: - Methods
    
    /**
     Set the format pattern for log messages.
     
     - Parameters:
       - pattern: The format pattern to set.
     */
    public static func setFormatPattern(with pattern: String) {
        logBuilder = LogBuilder(
            logFormatter: CustomizableLogFormatter(pattern: pattern),
            dateFormatter: DefaultDateFormatter().formatter
        )
    }
    
    /**
     Set the file output path.
     
     - Parameters:
       - path: The path to output.
     */
    public static func setFileOutputPath(to path: String) {
        localFileStream = LocalFileStream(filePath: path)
    }
    
}
