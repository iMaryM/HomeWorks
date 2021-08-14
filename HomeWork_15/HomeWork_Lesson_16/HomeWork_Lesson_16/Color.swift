//
//  Colors.swift
//  HomeWork_Lesson_16
//
//  Created by Мария Манжос on 9.08.21.
//

import UIKit

class Color {
    
    let red: Int = Int.random(in: 0...255)
    let green: Int = Int.random(in: 0...255)
    let blue: Int = Int.random(in: 0...255)
    
    let color: UIColor
    let nameOfColor: String
    
    init(nameOfColor: String) {
        self.color = UIColor(red: CGFloat(red) / 255,
                             green: CGFloat(green) / 255,
                             blue: CGFloat(blue) / 255,
                             alpha: 1.0)
        self.nameOfColor = nameOfColor
    }
    
}
