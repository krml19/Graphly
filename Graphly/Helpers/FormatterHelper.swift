//
//  FormatterHelper.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/16/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation

class FormatterHelper {
    
    private static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSize = 3
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    class func convertRange(range: (min: Int, max: Int)) -> String {
        let numbers: (min: NSNumber, max: NSNumber) = (min: NSNumber(integerLiteral: range.min), max: NSNumber(integerLiteral: range.max))
        let minString: String = formatter.string(from: numbers.min) ?? ""
        let maxString: String = formatter.string(from: numbers.max) ?? ""
        
        return minString + " - " + maxString
    }
}
