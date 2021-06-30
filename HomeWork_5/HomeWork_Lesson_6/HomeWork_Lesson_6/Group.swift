//
//  Group.swift
//  HomeWork_Lesson_6
//
//  Created by Мария Манжос on 30.06.21.
//

import Foundation

class Group {
    let nameOfGroup: String
    var journalOfStudents: [Student]
    
    init(nameOfGroup: String, journalOfStudents: [Student]) {
        self.nameOfGroup = nameOfGroup
        self.journalOfStudents = journalOfStudents
    }
    
    func printAllStudentsInGroup () {
        print("Group: \(nameOfGroup)")
        print("Journal of students:")
        for value in journalOfStudents {
            print("\(value.firstNam) \(value.lastName), average score: \(value.averageScore)")
        }
        print()
    }
    
    func removeStudentsWithAverageScoreLess (then averageScore: Double) {
        var index = journalOfStudents.count - 1
        while index > 0 {
            if journalOfStudents[index].averageScore < averageScore {
                journalOfStudents.remove(at: index)
            }
            index -= 1
        }
    }
}
