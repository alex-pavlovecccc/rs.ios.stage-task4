import Foundation

public extension Int {
    
    var roman: String? {
        
        var result = ""
        var value = self
        
        let roman: [String] = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        let arabic: [Int] = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 ]
        
        guard self > 0 && self <= 3999 else { return nil }
        
        for (i,j) in arabic.enumerated() {
            while (value >= arabic[i]) {
                value -= j
                result += roman[i]
            }
        }
        
        return result
        
    }
}
