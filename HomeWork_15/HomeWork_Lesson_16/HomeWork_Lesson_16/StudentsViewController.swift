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
    
    var sortedStudents: Dictionary = [String : [Student]]()
    
    var titlesOfSections: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Table of Students"
        
        studentTableView.dataSource = self
        studentTableView.delegate = self
        
        studentTableView.register(UINib(nibName: "StudentsTableViewCell", bundle: nil), forCellReuseIdentifier: "StudentsTableViewCell")
        
        //получить ключи и для каждого улюча добавить свой список студентов
        
        for value in students {
            if !sortedStudents.keys.contains(value.category){
                sortedStudents["\(value.category)"] =  students.filter({$0.category == value.category})
            }
        }
        
        titlesOfSections = sortedStudents.keys.sorted()
    }

}

extension StudentsViewController: UITableViewDataSource {
    
    //количество ячеек в секции = количество студентов в массиве по ключу
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let countOfstudents = sortedStudents[titlesOfSections[section]] else {
            return 0
        }
        
        return countOfstudents.count
    }
    
    //содержимое ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StudentsTableViewCell") as? StudentsTableViewCell,
              let students = sortedStudents[titlesOfSections[indexPath.section]] else {
            return UITableViewCell()
        }
        let sortedStudents = students.sorted {$0.firstName < $1.firstName}
        cell.labelFIO.text = "\(sortedStudents[indexPath.row].firstName) \(sortedStudents[indexPath.row].lastName)"
        cell.labelAverageScore.text = "\(sortedStudents[indexPath.row].averageScore)"
        cell.labelFIO.textColor = sortedStudents[indexPath.row].averageScore < 4 ? .red : .black
        
        return cell
        
    }
    
}

extension StudentsViewController: UITableViewDelegate {
    //высота одной ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //количество секций в таблице
    func numberOfSections(in tableView: UITableView) -> Int {
        return titlesOfSections.count
    }

    //заголовок секции
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titlesOfSections[section]
    }
    
}


