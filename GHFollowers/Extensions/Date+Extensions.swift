//
//  Date+Extensions.swift
//  GHFollowers
//
//  Created by Nick Pappas on 3/26/22.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
