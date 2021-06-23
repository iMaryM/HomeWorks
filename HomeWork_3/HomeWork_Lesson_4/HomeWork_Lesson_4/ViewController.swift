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
        let tuple1: (name: String, age: Int, salary: Float) = ("Mary", 16, 10.00)
        let tuple2: (name: String, age: Int, salary: Float) = ("Mary", 25, 100.00)
        let tuple3: (name: String, age: Int, salary: Float) = ("Mary", 37, 1000.00)
        let tuple4: (name: String, age: Int, salary: Float) = ("Mary", 42, 1000.00)
        
        print("===TASK_1===")
        calculateSalary(tuple: tuple1)
        calculateSalary(tuple: tuple2)
        calculateSalary(tuple: tuple3)
        calculateSalary(tuple: tuple4)
        print()
        
    }
    
    //task_1
    
    func calculateSalary(tuple: (name: String, age: Int, salary: Float)) {
        
        var newSalary: Float = 0.0;
        
        switch tuple.age {
        case 0...17:
            newSalary += tuple.salary
        case 18...30:
            newSalary += (tuple.salary * 1.50)
        case 31...40:
            newSalary += (tuple.salary * 2.0)
        default:
            newSalary += (tuple.salary * 3.0)
        }
        
        print("For \(tuple.name), age \(tuple.age), salary \(tuple.salary): new salary is \(newSalary)")
        
    }

}

