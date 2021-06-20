//
//  ViewController.swift
//  MaryHomeWork_1
//
//  Created by Мария Манжос on 16.06.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //task_1
        
        let x = 2.59, y = 10.47, z = 0.29, w = 9.78
        
        let xOfInteger = Int(x), yOfInteger = Int(y), zOfInteger = Int(z), wOfInteger = Int(w)
        
        let sumOfInteger = xOfInteger + yOfInteger + zOfInteger + wOfInteger
        let resultOfMultiplicationOfInteger = xOfInteger * yOfInteger * zOfInteger * wOfInteger
        
        print("Сумма целых частей (\(xOfInteger), \(yOfInteger), \(zOfInteger), \(wOfInteger)) равна \(sumOfInteger)")
        print("Произведение целых частей  (\(xOfInteger), \(yOfInteger), \(zOfInteger), \(wOfInteger)) равно \(resultOfMultiplicationOfInteger)")
        
        let xOfMod = Int(((x - Double(xOfInteger)) * 100.00)), yOfMod = Int(((y - Double(yOfInteger)) * 100.00)), zOfMod = Int(((z - Double(zOfInteger)) * 100.00)), wOfMod = Int(((w - Double(wOfInteger)) * 100.00))
        
        let sumOfMod = xOfMod + yOfMod + zOfMod + wOfMod
        let resultOfMultiplicationOfMod = xOfMod * yOfMod * zOfMod * xOfMod
        
        print("Сумма дробных частей (\(xOfMod), \(yOfMod), \(zOfMod), \(wOfMod)) равна \(sumOfMod)")
        print("Произведение дробных частей (\(xOfMod), \(yOfMod), \(zOfMod), \(wOfMod)) равно \(resultOfMultiplicationOfMod)")
        
        //task_2
        
        let value = 50000
        
        if (value % 2) != 0 {
            print("Число \(value) - НЕчетное")
        } else if value == 0 {
            print("Число \(value) является нулем")
        } else {
            print("Число \(value) - четное")
        }
    }


}

