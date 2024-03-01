//
//  Date+Additions.swift
//  RandomUser
//
//  Created by barufe on 28/02/24.
//

import Foundation

extension Date {
    static func date(from string: String, format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: string)
    }
}

extension Date {
    static func formattedString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" 
        return dateFormatter.string(from: date)
    }
}
