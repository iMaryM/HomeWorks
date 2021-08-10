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
    var averageScore = Int.random(in: 2...5)
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        switch self.averageScore {
        case 5:
            category = "A-grade"
        case 4:
            category = "B-grade"
        case 3:
            category = "C-grade"
        case 2:
            category = "D-grade"
        default:
            category = ""
        }
    }
}
