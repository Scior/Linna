//
//  LinnaStream.swift
//  Linna
//
//  Created by Suita Fujino on 2018/11/16.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

/**
 The protocol for the output stream.
 */
public protocol LinnaStream {
    /**
     Outputs the message with the defined stream.
     
     - Parameters:
       - message: A message to output
     */
    func out(message: String)
}
