//
//  ViewController.swift
//  HomeWork_Lesson_6
//
//  Created by Мария Манжос on 30.06.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let student1: Student = Student(lastName: "Mary", firstName: "Manzhos", yearOfBirth: 1994, averageScore: 8.3)
        let student2: Student = Student(lastName: "Natali", firstName: "Byrum", yearOfBirth: 1991, averageScore: 7.2)
        let student3: Student = Student(lastName: "Maks", firstName: "Moroz", yearOfBirth: 1989, averageScore: 5.8)
        let student4: Student = Student(lastName: "Igor", firstName: "Malin", yearOfBirth: 1993, averageScore: 7.9)
        let student5: Student = Student(lastName: "Julia", firstName: "Baranovsky", yearOfBirth: 1990, averageScore: 8.9)
        
        
        let group1: Group = Group(nameOfGroup: "Group_1", journalOfStudents: [student1, student2, student3, student4, student5])
        
        group1.printAllStudentsInGroup()
        group1.removeStudentsWithAverageScoreLess(then: 8.0)
        group1.printAllStudentsInGroup()
        
    }


}

