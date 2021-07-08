//
//  ViewController2.swift
//  HomeWork_Lesson_8_Part_2
//
//  Created by Мария Манжос on 7.07.21.
//

import UIKit

class ViewController2: UIViewController {
    
    var currentView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 145 / 255, green: 180 / 255, blue: 180 / 255, alpha: 1.0)
    
        var y = 50
        var x = 50

        for i in 1...8 {

            x = 50
            
            for j in 1...8 {
                
                currentView = UIView(frame: CGRect(x: x, y: y, width: 30, height: 30))
                
                if (i + j) % 2 != 0 {
                    currentView.backgroundColor = UIColor.white
                } else {
                    currentView.backgroundColor = UIColor.black
                }
                
                view.addSubview(currentView)
                
                x += 30
                
            }

            y += 30

        }

    }

}
