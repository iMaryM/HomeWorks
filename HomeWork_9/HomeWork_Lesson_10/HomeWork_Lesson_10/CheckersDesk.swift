//
//  CheckersDesk.swift
//  HomeWork_Lesson_10
//
//  Created by Мария Манжос on 17.07.21.
//

import Foundation
import UIKit

class CheckersDesk {
    var currentView = UIView()
    
    func addCheckersDesk () -> UIView {
//        var arr = [[UIView]]()
//        var arrT = [UIView]()
        var y = 100
        for i in 0...7 {
            var x = 40
            for j in 0...7 {
                currentView = UIView(frame: CGRect(x: x, y: y, width: 30, height: 30))
                if (i + j) % 2 != 0 {
                    currentView.backgroundColor = UIColor.white
                } else {
                    currentView.backgroundColor = UIColor.black
                }
                layoutOfDesk.addSubview(currentView)
//                arrT.insert(currentView, at: j)
                x += 30
            }
//            arr.insert(arrT, at: i)
            y += 30
        }
        
//        return arr
        return layoutOfDesk
    }
}
