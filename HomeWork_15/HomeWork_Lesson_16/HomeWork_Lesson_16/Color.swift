//
//  Colors.swift
//  HomeWork_Lesson_16
//
//  Created by Мария Манжос on 9.08.21.
//

import UIKit

class Color {
    let color: UIColor
    let nameOfColor: String
    
    init(color: UIColor, nameOfColor: String) {
        self.color = color
        self.nameOfColor = nameOfColor
    }
    
    static func createColors(count: Int) -> [Color] {
        var colors: [Color] = []
        for i in 0...count{
            let color = UIColor.random()
            colors.append(Color(color: color, nameOfColor: "Color\(i)"))
        }
        
        return colors
    }
    
}
