//
//  ViewController_3.swift
//  HomeWork_Lesson_4
//
//  Created by Мария Манжос on 23.06.21.
//

import UIKit

class ViewController_3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("===TASK_3===")
        calculateCredit(sum: 10, period: 1, perc: 1)
        print()
        
    }
    
    func calculateCredit(sum: Double, period: Int, perc: Double) {
        var payOfMonth: Double = 0.0
        var sumOfPay: Double = 0.0
        let convertedPerc = perc / 100.0
        
        payOfMonth = (sum * convertedPerc * pow((1 + convertedPerc), Double(period))) / (12 * (pow((1 + convertedPerc), Double(period)) - 1))
        
        sumOfPay = (payOfMonth * 12) * Double(period)
        
        print("Сумма кредита: \(round(sum * 100)/100) руб.")
        print("Период: \(period) \(defineEndingOfTheWorld(countOfyear: period))")
        print("Ставка: \(round(perc * 100)/100) %")
        print("Ежемесячный платеж: \(round(payOfMonth * 100)/100) руб.")
        print("Общая сумма выплат: \(round(sumOfPay * 100)/100) руб.")
    }
    
    
    func defineEndingOfTheWorld (countOfyear: Int) -> String {

        let modOfHundred = countOfyear % 100
        let modOfTen = countOfyear % 10
        
        if modOfHundred > 19 {
            switch modOfTen {
            case 1:
                return "год"
            case 2, 3, 4:
                return "года"
            case 0, 5, 6, 7, 8, 9:
                return "лет"
            default:
                break
            }
        } else {
            switch modOfHundred {
            case 1:
                return "год"
            case 2, 3, 4:
                return "года"
            case 0, 5, 6, 7, 8, 9:
                return "лет"
            case 11...19:
                return "лет"
            default:
                break
            }
        }
        
        return ""
    }

}
