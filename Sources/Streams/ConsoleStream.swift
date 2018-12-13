//
//  ConsoleStream.swift
//  Linna
//
//  Created by Suita Fujino on 2018/11/16.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

/**
 The output stream for the console.
 */
class ConsoleStream: LinnaStream {
    // (Inherit doc.)
    func out(message: String) {
        print(message)
    }
}
