//
//  Linna+InternalPrint.swift
//  Linna
//
//  Created by Suita Fujino on 2018/12/09.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

/**
 The extension to support outputting internal event logs occured in Linna.
 */
extension Linna {
    
    internal static let prefixForInternalPrint = "[--Linna--] "
    
    /**
     Prints the event's description occured inside Linna.
     
     - Parameters:
       - message: The event's description.
     */
    internal static func iPrint(message: String) {
        print(prefixForInternalPrint + message)
    }
}
