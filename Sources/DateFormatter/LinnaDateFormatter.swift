//
//  LinnaDateFormatter.swift
//  Linna
//
//  Created by Suita Fujino on 2018/12/01.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

/**
 A protocol for the date formatter.
 */
protocol LinnaDateFormatter {
    /// The instance used by the log formatter.
    var formatter: DateFormatter { get }
}
