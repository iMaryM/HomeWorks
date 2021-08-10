//
//  StudentsViewController.swift
//  HomeWork_Lesson_16
//
//  Created by Мария Манжос on 9.08.21.
//

import UIKit

class StudentsViewController: UIViewController {
    
    @IBOutlet weak var studentTableView: UITableView!
    
    let students: [Student] = [
        Student(firstName: "Smith", lastName: "Jack"),
        Student(firstName: "Morozov", lastName: "Max"),
        Student(firstName: "Chu", lastName: "Tanya"),
        Student(firstName: "Lee", lastName: "Chan"),
        Student(firstName: "Bebekh", lastName: "Nastya"),
        Student(firstName: "Kondrashonok", lastName: "Ann"),
        Student(firstName: "Moiseev", lastName: "Ilya"),
        Student(firstName: "Burim", lastName: "Natali"),
        Student(firstName: "Shum", lastName: "Mary"),
        Student(firstName: "Pitt", lastName: "Bred"),
        Student(firstName: "Cuoco", lastName: "Kely"),
        Student(firstName: "Parsons", lastName: "Jim"),
        Student(firstName: "Hepbern", lastName: "Odri"),
        Student(firstName: "Portman", lastName: "Nataly"),
        Student(firstName: "Johonson", lastName: "Scarlet"),
        Student(firstName: "Hardi", lastName: "Tom"),
        Student(firstName: "Hemsvort", lastName: "Chris"),
        Student(firstName: "Manzhos", lastName: "Mary")
    ]

    var categoriesOfStudents: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Table of Students"
        
        studentTableView.dataSource = self
        studentTableView.delegate = self
        
        studentTableView.register(UINib(nibName: "StudentsTableViewCell", bundle: nil), forCellReuseIdentifier: "StudentsTableViewCell")
        
        for value in students {
            if !categoriesOfStudents.contains(value.category) {
                categoriesOfStudents.append(value.category)
            }
        }
        categoriesOfStudents.sort()
    }

}

extension StudentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch categoriesOfStudents[section] {
        case "A-grade":
            return calculateCount(students: students, category: "A-grade").count
        case "B-grade":
            return calculateCount(students: students, category: "B-grade").count
        case "C-grade":
            return calculateCount(students: students, category: "C-grade").count
        case "D-grade":
            return calculateCount(students: students, category: "D-grade").count
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StudentsTableViewCell") as? StudentsTableViewCell else {
            return UITableViewCell()
        }
    
        let section = indexPath.section
        
        let grade = getGrade(section: section)
        
        if grade.isEmpty {
            return cell
        }
        
        let groupOfStudents = calculateCount(students: students, category: grade)
        let sortedStudents = groupOfStudents.sorted(by: {$0.firstName < $1.firstName})
        
        cell.labelFIO.text = "\(sortedStudents[indexPath.row].firstName) \(sortedStudents[indexPath.row].lastName)"
        cell.labelAverageScore.text = "\(sortedStudents[indexPath.row].averageScore)"
        
        cell.labelFIO.textColor = sortedStudents[indexPath.row].averageScore < 4 ? .red : .black
        
        return cell
        
    }
    
}

extension StudentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoriesOfStudents.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(categoriesOfStudents[section])"
    }
    
}

func calculateCount(students: [Student], category: String?) -> [Student] {
    var groupOfStudent: [Student] = []
    
    for value in students{
        if value.category == category{
            groupOfStudent.append(value)
        }
    }
    
    return groupOfStudent
}

func getGrade(section: Int) -> String {
    switch section {
    case 0:
        return "A-grade"
    case 1:
        return "B-grade"
    case 2:
        return "C-grade"
    case 3:
        return "D-grade"
    default:
        return ""
    }
}
