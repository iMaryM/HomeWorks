//
//  ViewController.swift
//  HomeWork_Lesson_3
//
//  Created by Мария Манжос on 20.06.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //task_1
        
        let myFitnesProgress: (Int, Int, Int) = (10, 3, 50)
        
        print("===============TASK_1====================")
        print()
        print("Достижения за сегодня (отжимания, подтягивания, приседания) - \(myFitnesProgress)")
        print()
        
        //task_2
        
        typealias FitnesProgress = (maxPushUp: Int, maxPullUp: Int, maxSquat: Int)
        
        let myNewFitnesProgress: FitnesProgress = (9, 4, 35)
        
        print("===============TASK_2====================")
        print()
        print("Мои результаты(по индексу):")
        print("Максимальное количество отжиманий - \(myNewFitnesProgress.0)")
        print("Максимальное количество подтягиваний - \(myNewFitnesProgress.1)")
        print("Максимальное количество приседаний - \(myNewFitnesProgress.2)")
        print()
        print("=========================================")
        print()
        print("Мои результаты(по параметру):")
        print("Максимальное количество отжиманий - \(myNewFitnesProgress.maxPushUp)")
        print("Максимальное количество подтягиваний - \(myNewFitnesProgress.maxPullUp)")
        print("Максимальное количество приседаний - \(myNewFitnesProgress.maxSquat)")
        print()
        
        //task_3
        
        let myFriendFitnesProgress: FitnesProgress = (25, 30, 27)
        
        print("===============TASK_3====================")
        print()
        print("Результаты Марины:")
        print("Максимальное количество отжиманий - \(myFriendFitnesProgress.maxPushUp)")
        print("Максимальное количество подтягиваний - \(myFriendFitnesProgress.maxPullUp)")
        print("Максимальное количество приседаний - \(myFriendFitnesProgress.maxSquat)")
        print()
        
        //task_4
        
        let maxPushUpN = myNewFitnesProgress.maxPushUp - myFriendFitnesProgress.maxPushUp
        let maxPullUpN = myNewFitnesProgress.maxPullUp - myFriendFitnesProgress.maxPullUp
        let maxSquatN = myNewFitnesProgress.maxSquat - myFriendFitnesProgress.maxSquat
        
        let newFitnesProgress: FitnesProgress = (maxPushUpN, maxPullUpN, maxSquatN)
        
        print("===============TASK_4====================")
        print()
        print("Результаты(разница межды первым и вторым):")
        print("Максимальное количество отжиманий - \(newFitnesProgress.maxPushUp)")
        print("Максимальное количество подтягиваний - \(newFitnesProgress.maxPullUp)")
        print("Максимальное количество приседаний - \(newFitnesProgress.maxSquat)")
        print()
        
        //task_5
        
        let firstString: String? = "12345"
        let secondString: String? = "Mary1"
        let thirdString: String? = "678"
        let fourthString: String? = "Mary89"
        let fifthString: String? = "10000"
        
        let convertedFirstString = Int(firstString!)
        let convertedSecondString = Int(secondString!)
        let convertedThirdString = Int(thirdString!)
        let convertedFourthString = Int(fourthString!)
        let convertedFifthString = Int(fifthString!)
        
        var sum: Int = 0;
        
        print("===============TASK_5====================")
        print()
        print("Принудительное извлечение:")
        
        if convertedFirstString != nil {
            sum += convertedFirstString!
            print("\(convertedFirstString!) + ", terminator: "")
        } else {
            print("\(convertedFirstString) + ", terminator: "")
        }
        
        if convertedSecondString != nil {
            sum += convertedSecondString!
            print("\(convertedSecondString!) + ", terminator: "")
        } else {
            print("\(convertedSecondString) + ", terminator: "")
        }
        
        if convertedThirdString != nil {
            sum += convertedThirdString!
            print("\(convertedThirdString!) + ", terminator: "")
        } else {
            print("\(convertedThirdString) + ", terminator: "")
        }
        
        if convertedFourthString != nil {
            sum += convertedFourthString!
            print("\(convertedFourthString!) + ", terminator: "")
        } else {
            print("\(convertedFourthString) + ", terminator: "")
        }
        
        if convertedFifthString != nil {
            sum += convertedFifthString!
            print("\(convertedFifthString!) ", terminator: "")
        } else {
            print("\(convertedFifthString) ", terminator: "")
        }
        
        print("= \(sum)")
        print()
        
        sum = 0
        
        print("Объединение по nill:")
        
        let convertedFirstStringN = convertedFirstString ?? 0
        let convertedSecondStringN = convertedSecondString ?? 0
        let convertedThirdStringN = convertedThirdString ?? 0
        let convertedFourthStringN = convertedFourthString ?? 0
        let convertedFifthStringN = convertedFifthString ?? 0
        
        sum = convertedFirstStringN + convertedSecondStringN + convertedThirdStringN + convertedFourthStringN + convertedFifthStringN
        
        print("\(convertedFirstStringN) + \(convertedSecondStringN) + \(convertedThirdStringN) + \(convertedFourthStringN) + \(convertedFifthStringN) = \(sum)")
        print()
        
        sum = 0
        
        print("Привязка опционалов:")
        
        if let convertedFirstString = convertedFirstString {
            sum += convertedFirstString
            print("\(convertedFirstString) + ", terminator: "")
        } else {
            print("\(convertedFirstString) + ", terminator: "")
        }
        
        if let convertedSecondString = convertedSecondString {
            sum += convertedSecondString
            print("\(convertedSecondString) + ", terminator: "")
        } else {
            print("\(convertedSecondString) + ", terminator: "")
        }
        
        if let convertedThirdString = convertedThirdString {
            sum += convertedThirdString
            print("\(convertedThirdString) + ", terminator: "")
        } else {
            print("\(convertedThirdString) + ", terminator: "")
        }
        
        if let convertedFourthString = convertedFourthString {
            sum += convertedFourthString
            print("\(convertedFourthString) + ", terminator: "")
        } else {
            print("\(convertedFourthString) + ", terminator: "")
        }
        
        if let convertedFifthString = convertedFifthString {
            sum += convertedFifthString
            print("\(convertedFifthString) ", terminator: "")
        } else {
            print("\(convertedFifthString) ", terminator: "")
        }
        
        print("= \(sum)")
        print()
        
        //task_6
        
        typealias ProtocolHTTP = (code: Int, message: String?, errorMessage: String?)
        
        let protocolAnswer: ProtocolHTTP = (500, nil, "Server Error");
        
        print("===============TASK_6====================")
        print()
        
        if (protocolAnswer.code >= 100 && protocolAnswer.code < 200) && protocolAnswer.message != nil {
            print("The status code is \(protocolAnswer.code)")
            print("The status message is \(protocolAnswer.message!)")
        }
        
        if (protocolAnswer.code >= 200 && protocolAnswer.code < 300) && protocolAnswer.message != nil {
            print("The status code is \(protocolAnswer.code)")
            print("The status message is \(protocolAnswer.message!)")
        }
        
        if (protocolAnswer.code >= 300 && protocolAnswer.code < 526) && protocolAnswer.errorMessage != nil  {
            print("The status code is \(protocolAnswer.code)")
            print("The status message is \(protocolAnswer.errorMessage!)")
        }
        
        print()
        
        typealias ProtocolMessage = (message: String?, errorMessage: String?)
        
        let protocolMessageAnswer: ProtocolMessage = ("OK", nil)
        
        if let protocolMessageAnswerMessage = protocolMessageAnswer.message {
            print("The status message is \(protocolMessageAnswerMessage)")
        }
        
        if let protocolMessageAnswerErrorMessage = protocolMessageAnswer.errorMessage {
            print("The status message is \(protocolMessageAnswerErrorMessage)")
        }
        
        print()

        //task_7
        
        
    }


}

