//
//  ViewController_2.swift
//  HomeWork_Lesson_4
//
//  Created by Мария Манжос on 22.06.21.
//

import UIKit

class ViewController_2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //task_2
        print("===TASK_2===")
        calculateAverage(10, 9, 4)
        print()
        
    }
    
    //task_2
    
    func calculateAverage(_ a: Int, _ b: Int, _ c: Int) {
        var average: Double = 0.0
        
        average = (Double(a) + Double(b) + Double(c)) / 3.0
        
        print("Среднее арифметическое чисел (\(a), \(b), \(c)): \(average)")
    }

}
