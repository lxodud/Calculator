//
//  StringExtension.swift
//  Calculator
//
//  Created by Hamo on 2022/09/27.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        var result: [String] = []
        var nonTargets: [String] = []
        var isSign: Bool = true
        
        self.forEach { character in
            if character == target && !isSign {
                isSign = true
                result.append(nonTargets.joined(separator: ""))
                result.append(String(character))
                nonTargets = []
            } else {
                isSign = false
                nonTargets.append(String(character))
            }
        }
        
        result.append(nonTargets.joined(separator: ""))
        return result.filter { $0 != "" }
    }
    
    func formatStyleToDecimal(_ numberFormatter: NumberFormatter) -> String {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumFractionDigits = 20
        guard let result = numberFormatter.string(for: Double(self)) else {
            return self
        }
        
        return result
    }
    
    func splitByDot() -> (String, String) {
        let decimalNumberComponents = self.split(separator: Character(CalculatorConstant.dot),
                                                 omittingEmptySubsequences: false)
        let integerPart = decimalNumberComponents[0].description
        let decimalPart = decimalNumberComponents[1].description
        
        return (integerPart, decimalPart)
    }
}
