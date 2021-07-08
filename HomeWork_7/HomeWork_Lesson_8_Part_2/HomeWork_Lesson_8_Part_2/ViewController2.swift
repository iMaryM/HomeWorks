//
//  ViewController2.swift
//  HomeWork_Lesson_8_Part_2
//
//  Created by Мария Манжос on 7.07.21.
//

import UIKit

class ViewController2: UIViewController {
    
    var whiteView: UIView = UIView()
    var blackView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 145 / 255, green: 180 / 255, blue: 180 / 255, alpha: 1.0)
        
        var y = 50
        var x = 50

        for i in 1...8 {

            x = 50

            if i % 2 != 0 {
                for _ in 1...4 {
                    whiteView = UIView(frame: CGRect(x: x, y: y, width: 30, height: 30))
                    whiteView.backgroundColor = UIColor.white
                    view.addSubview(whiteView)
                    blackView = UIView(frame: CGRect(x: x + 30, y: y, width: 30, height: 30))
                    blackView.backgroundColor = UIColor.black
                    view.addSubview(blackView)
                    x += 60
                }
            } else {
                for _ in 1...4 {
                    blackView = UIView(frame: CGRect(x: x, y: y, width: 30, height: 30))
                    blackView.backgroundColor = UIColor.black
                    view.addSubview(blackView)
                    whiteView = UIView(frame: CGRect(x: x + 30, y: y, width: 30, height: 30))
                    whiteView.backgroundColor = UIColor.white
                    view.addSubview(whiteView)
                    x += 60
                }
            }

            y += 30

        }

    }

}
