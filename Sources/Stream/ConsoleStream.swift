//
//  ConsoleStream.swift
//  Linna
//
//  Created by Suita Fujino on 2018/11/16.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

/**
 The output stream for console.
 */
class ConsoleStream: LinnaStream {
    func out(message: String) {
        print(message)
    }
}
