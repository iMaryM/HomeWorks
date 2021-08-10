//
//  UIColor+CoreKit.swift
//  HomeWork_Lesson_16
//
//  Created by Мария Манжос on 9.08.21.
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue:  .random(in: 0...1),
                       alpha: 1.0)
    }
    
    func getRGB() -> (red: Int, green: Int, blue: Int){
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (Int(red * 255), Int(green * 255), Int(blue * 255))
    }
    
}
