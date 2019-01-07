//
//  DefaultDateFormatter.swift
//  Linna
//
//  Created by Suita Fujino on 2018/12/01.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

/**
 A date formatter used by default.
 */
public class DefaultDateFormatter: LinnaDateFormatter {
    public let formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        return dateFormatter
    }()
}
