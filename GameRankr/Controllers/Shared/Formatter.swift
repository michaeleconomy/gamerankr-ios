//
//  Formatter.swift
//  GameRankr
//
//  Created by Michael Economy on 8/18/22.
//  Copyright © 2022 Michael. All rights reserved.
//

import Foundation

class Formatter {
    class func format(_ i: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:i)) ?? "Error"
    }
    
    class func format(_ d: Double) -> String {
        return String(format: "%.2f", d)
    }
    
    class func format(dateString: String?, defaultString: String = "Unknown") -> String {
        guard let dateString = dateString else {
            return defaultString
        }
        
        return formatDate(dateString) ?? defaultString
    }
    
    class func parseDate(_ dateString: String) -> Date? {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss zzz"
        
        return dateFormatterGet.date(from: dateString)
    }
    
    class func formatDate(_ dateString: String) -> String? {
        guard let date = parseDate(dateString) else {
            return nil
        }
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd, yyyy"
        return dateFormatterPrint.string(from: date)
    }
}
