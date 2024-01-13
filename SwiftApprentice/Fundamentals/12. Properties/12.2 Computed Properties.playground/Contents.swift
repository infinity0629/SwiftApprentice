import Cocoa

struct TV {
    var height: Double
    var width: Double

//    var diagonal: Int {
//        let result = (height * height + width * width).squareRoot().rounded() // rounded 方法按照标准规则对值进行四舍五入
//        return Int(result)
//    }
    
    var diagonal: Int {
        get {
            let result = (height * height + width * width).squareRoot().rounded()
            return Int(result)
        }
        set { // 自带 newValue 参数
            let ratioWidth = 16.0
            let ratioHeight = 9.0
            
            let ratioDiagonal = (ratioWidth * ratioWidth + ratioHeight * ratioHeight).squareRoot()
            height = Double(newValue) * ratioHeight / ratioDiagonal
            width = height * ratioWidth / ratioHeight
        }
    }
}

var tv = TV(height: 53.93, width: 95.87)



tv.diagonal
tv.width = tv.height
tv.diagonal



tv.diagonal = 70
tv.height
tv.width
