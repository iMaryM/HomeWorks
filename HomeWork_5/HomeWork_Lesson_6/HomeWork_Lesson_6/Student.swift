//
//  Student.swift
//  HomeWork_Lesson_6
//
//  Created by Мария Манжос on 30.06.21.
//

import Foundation

class Student {
    let lastName: String
    let firstNam: String
    let yearOfBirth: Int
    let averageScore: Double
    
    init(lastName: String, firstName: String, yearOfBirth: Int, averageScore: Double) {
        self.lastName = lastName
        self.firstNam = firstName
        self.yearOfBirth = yearOfBirth
        self.averageScore = averageScore
    }
}
