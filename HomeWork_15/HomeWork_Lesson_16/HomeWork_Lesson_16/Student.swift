//
//  Students.swift
//  HomeWork_Lesson_16
//
//  Created by Мария Манжос on 9.08.21.
//

import Foundation

class Student {
    var category: String
    var firstName: String
    var lastName: String
    var averageScore = (((Float.random(in: 2...5) * 100).rounded()) / 100.00)
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        switch self.averageScore {
        case 5.0:
            category = "A-grade"
        case 4.0...4.99:
            category = "B-grade"
        case 3.0...3.99:
            category = "C-grade"
        case 2.0...2.99:
            category = "D-grade"
        default:
            category = ""
        }
    }
}
