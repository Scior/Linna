//
//  LocalFileStream.swift
//  Linna
//
//  Created by Suita Fujino on 2018/12/08.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import Foundation

/**
 The output stream for the local file.
 */
class LocalFileStream: LinnaStream {
    
    // MARK: - Properties
    
    let outputPath: URL
    
    // MARK: - Lifecycles
    
    /**
     Failable initializer with a file path.
     
     - Parameters:
       - filePath: The file path appended to the output directory.
     */
    init?(filePath: String) {
        outputPath = URL(fileURLWithPath: FileManager.default.currentDirectoryPath).appendingPathComponent(filePath)
        if !FileManager.default.fileExists(atPath: outputPath.absoluteString) {
            if (try? "".write(to: outputPath, atomically: false, encoding: .utf8)) == nil {
                return nil
            }
            Linna.iPrint(message: "Created log file at: \(outputPath)")
        }
        
        Linna.iPrint(message: "Log file will be found at: \(outputPath)")
    }
    
    // MARK: - Methods
    
    func out(message: String) {
        do {
            let fileHandle = try FileHandle(forWritingTo: outputPath)
            fileHandle.seekToEndOfFile()
            guard let dataToWrite = ("\n" + message).data(using: .utf8) else { return }
            
            fileHandle.write(dataToWrite)
        } catch let error {
            Linna.iPrint(message: "Couldn't write to the log file: \(error.localizedDescription)")
        }
    }
}
