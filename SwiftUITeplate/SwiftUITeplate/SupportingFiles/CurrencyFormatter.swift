//
//  CurrencyFormatter.swift
//  SwiftUITeplate
//
//  Created by Levon Shaxbazyan on 01.05.24.
//

import Foundation

class CurrencyFormatter {
    static func formatCurrency(amount: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "₽"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.locale = Locale(identifier: "ru_RU")
        
        if let formatteredAmount = formatter.string(from: NSNumber(value: amount)) {
            return formatteredAmount
        } else {
            return "0,00 ₽"
        }
    }
}
