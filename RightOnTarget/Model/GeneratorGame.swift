//
//  CalculateGame.swift
//  RightOnTarget
//
//  Created by olzhs on 14.01.2022.
//

import Foundation
import UIKit

class Generator: GeneratorProtocol {
    
    static func getRandomValue() -> Int {
        (1...50).randomElement()!
    }

    static func getRandomColor() -> UIColor {
        UIColor.random()
    }
    
}

protocol GeneratorProtocol {
    static func getRandomValue() -> Int
    static func getRandomColor() -> UIColor
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:    .random(),
                       green:  .random(),
                       blue:   .random(),
                       alpha:   1.0)
    }
    
    var hexString: String {
        let components = self.cgColor.components!

        let red = Float(components[0])
        let green = Float(components[1])
        let blue = Float(components[2])
        return String(format: "#%02lX%02lX%02lX", lroundf(red * 255), lroundf(green * 255), lroundf(blue * 255))
    }
}

