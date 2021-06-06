import Foundation

final class FillWithColor {
    
    var bufer: [[Int]] = [[]]
    
    func fillWithColor(_ image: [[Int]], _ row: Int, _ column: Int, _ newColor: Int) -> [[Int]] {
        
        let m = image.count
        let n = image[0].count
        
        if (row < 0 && column < 0 && row >= m && column >= n && image[row][column] == newColor) {
            return image
        }
        
        bufer = image
        
        draw(row, column, newColor)
        return bufer
    }
    
    func draw(_ i: Int, _ j: Int, _ newColor: Int){
        
        if (i >= 0 && i < bufer.count && j >= 0 && j < bufer[i].count && bufer[i][j] != newColor) {
            
            bufer[i][j] = newColor
            
            
            draw(i, j + 1, newColor)
            draw(i + 1, j, newColor)
            draw(i, j - 1, newColor)
            draw(i - 1, j, newColor)
        }
    }
}

