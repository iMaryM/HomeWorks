//
//  ViewController.swift
//  HomeWork_Lesson_4
//
//  Created by Мария Манжос on 22.06.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //task_1
        var tuple1: (name: String, age: Int, salary: Float) = ("Mary", 16, 10.00)
        var tuple2: (name: String, age: Int, salary: Float) = ("Mary", 25, 100.00)
        var tuple3: (name: String, age: Int, salary: Float) = ("Mary", 37, 1000.00)
        var tuple4: (name: String, age: Int, salary: Float) = ("Mary", 42, 1000.00)
        
        print("===TASK_1===")
        print()
        calculateSalary(tuple: &tuple1)
        print("New tuple1: \(tuple1)")
        print()
        calculateSalary(tuple: &tuple2)
        print("New tuple2: \(tuple2)")
        print()
        calculateSalary(tuple: &tuple3)
        print("New tuple3: \(tuple3)")
        print()
        calculateSalary(tuple: &tuple4)
        print("New tuple4: \(tuple4)")
        print()
        
    }
    
    //task_1
    
    func calculateSalary(tuple: inout (name: String, age: Int, salary: Float)) {
        
        switch tuple.age {
        case 0...17:
            tuple.salary = tuple.salary
        case 18...30:
            tuple.salary = tuple.salary * 1.50
        case 31...40:
            tuple.salary = tuple.salary * 2.0
        default:
            tuple.salary = tuple.salary * 3.0
        }
        
        print("For \(tuple.name), age \(tuple.age), salary \(tuple.salary): new salary is \(tuple.salary)")
        
    }

}

