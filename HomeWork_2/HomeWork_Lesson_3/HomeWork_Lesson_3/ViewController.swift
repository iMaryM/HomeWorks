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
        
        typealias FitnesProgress = (maxPushUp: Int, maxPullUp: Int, maxSquat: Int)
        
        let myFitnesProgress: FitnesProgress = (10, 3, 50)
        
        print("===============TASK_1====================")
        print()
        print("Достижения за сегодня \(myFitnesProgress)")
        print()
        
        //task_2
        
        print("===============TASK_2====================")
        print()
        print("Мои результаты(по индексу):")
        print("Максимальное количество отжиманий - \(myFitnesProgress.0)")
        print("Максимальное количество подтягиваний - \(myFitnesProgress.1)")
        print("Максимальное количество приседаний - \(myFitnesProgress.2)")
        print()
        print("=========================================")
        print()
        print("Мои результаты(по параметру):")
        print("Максимальное количество отжиманий - \(myFitnesProgress.maxPushUp)")
        print("Максимальное количество подтягиваний - \(myFitnesProgress.maxPullUp)")
        print("Максимальное количество приседаний - \(myFitnesProgress.maxSquat)")
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
        
        let maxPushUpN = myFitnesProgress.maxPushUp - myFriendFitnesProgress.maxPushUp
        let maxPullUpN = myFitnesProgress.maxPullUp - myFriendFitnesProgress.maxPullUp
        let maxSquatN = myFitnesProgress.maxSquat - myFriendFitnesProgress.maxSquat
        
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
        
        typealias QualityControl = (name: String, numberOfCar: String?, mark: Int?)
        
        var maryExam: QualityControl;
        var ninaExam: QualityControl;
        var petrExam: QualityControl;
        var egorExam: QualityControl;
        var nataliExam: QualityControl;
        
        maryExam = ("Mary", "1234 AB-4", 7)
        ninaExam = ("Nina", nil, nil)
        petrExam = ("Petr", nil, nil)
        egorExam = ("Egor", nil, 9)
        nataliExam = ("Natali", "7892 CC-9", nil)
        
        let (maryName, maryCar, maryMark) = maryExam
        
        print("===============TASK_7====================")
        print()
        print("Student 1: ", terminator: "")
        print("Name: \(maryName); ", terminator: "")
        
        if let maryCar = maryCar {
            print("Have a car: Yes; ", terminator: "")
            print("Number of car: \(maryCar); ", terminator: "")
        } else {
            print("Have a car: No; ", terminator: "")
        }
        
        if let maryMark = maryMark {
            print("Have an exam: Yes; ", terminator: "")
            print("Mark: \(maryMark)", terminator: "")
        } else {
            print("Have an exam: No; ", terminator: "")
        }
        
        print()
    
        let (ninaName, ninaCar, ninaMark) = ninaExam
        
        print("Student 2: ", terminator: "")
        print("Name: \(ninaName); ", terminator: "")
        
        if let ninaCar = ninaCar {
            print("Have a car: Yes; ", terminator: "")
            print("Number of car: \(ninaCar); ", terminator: "")
        } else {
            print("Have a car: No; ", terminator: "")
        }
        
        if let ninaMark = ninaMark {
            print("Have an exam: Yes; ", terminator: "")
            print("Mark: \(ninaMark)", terminator: "")
        } else {
            print("Have an exam: No; ", terminator: "")
        }
        
        print()
        
        let (petrName, petrCar, petrMark) = petrExam
        
        print("Student 3: ", terminator: "")
        print("Name: \(petrName); ", terminator: "")
        
        if let petrCar = petrCar {
            print("Have a car: Yes; ", terminator: "")
            print("Number of car: \(petrCar); ", terminator: "")
        } else {
            print("Have a car: No; ", terminator: "")
        }
        
        if let petrMark = petrMark {
            print("Have an exam: Yes; ", terminator: "")
            print("Mark: \(petrMark)", terminator: "")
        } else {
            print("Have an exam: No; ", terminator: "")
        }
        
        print()
        
        let (egorName, egorCar, egorMark) = egorExam
        
        print("Student 4: ", terminator: "")
        print("Name: \(egorName); ", terminator: "")
        
        if let egorCar = egorCar {
            print("Have a car: Yes; ", terminator: "")
            print("Number of car: \(egorCar); ", terminator: "")
        } else {
            print("Have a car: No; ", terminator: "")
        }
        
        if let egorMark = egorMark {
            print("Have an exam: Yes; ", terminator: "")
            print("Mark: \(egorMark)", terminator: "")
        } else {
            print("Have an exam: No; ", terminator: "")
        }
        
        print()
        
        let (nataliName, nataliCar, nataliMark) = nataliExam
        
        print("Student 5: ", terminator: "")
        print("Name: \(nataliName); ", terminator: "")
        
        if let nataliCar = nataliCar {
            print("Have a car: Yes; ", terminator: "")
            print("Number of car: \(nataliCar); ", terminator: "")
        } else {
            print("Have a car: No; ", terminator: "")
        }
        
        if let nataliMark = nataliMark {
            print("Have an exam: Yes; ", terminator: "")
            print("Mark: \(nataliMark)", terminator: "")
        } else {
            print("Have an exam: No; ", terminator: "")
        }
        
        print()
        print()
        
        //task_8
        
        let tuple: (Int?, Int?, Int?, Int?, Int?) = (3, nil, 7, 9, nil)
        
        var sumTuple: Int = 0;
        
        print("===============TASK_8====================")
        print()
        print("Принудительное извлечение:")
        
        if tuple.0 != nil {
            sumTuple += tuple.0!
            print("\(tuple.0!) + ", terminator: "")
        } else {
            print("\(tuple.0) + ", terminator: "")
        }
        
        if tuple.1 != nil {
            sumTuple += tuple.1!
            print("\(tuple.1!) + ", terminator: "")
        } else {
            print("\(tuple.1) + ", terminator: "")
        }
        
        if tuple.2 != nil {
            sumTuple += tuple.2!
            print("\(tuple.2!) + ", terminator: "")
        } else {
            print("\(tuple.2) + ", terminator: "")
        }
        
        if tuple.3 != nil {
            sumTuple += tuple.3!
            print("\(tuple.3!) + ", terminator: "")
        } else {
            print("\(tuple.3) + ", terminator: "")
        }
        
        if tuple.4 != nil {
            sumTuple += tuple.4!
            print("\(tuple.4!) + ", terminator: "")
        } else {
            print("\(tuple.4) + ", terminator: "")
        }
        
        print("= \(sumTuple)")
        print()
        
        sumTuple = 0

        print("Объединение по nill:")

        let convertedFirstInt = tuple.0 ?? 0
        let convertedSecondInt = tuple.1 ?? 0
        let convertedThirdInt = tuple.2 ?? 0
        let convertedFourthInt = tuple.3 ?? 0
        let convertedFifthInt = tuple.4 ?? 0

        sumTuple = convertedFirstInt + convertedSecondInt + convertedThirdInt + convertedFourthInt + convertedFifthInt

        print("\(convertedFirstInt) + \(convertedSecondInt) + \(convertedThirdInt) + \(convertedFourthInt) + \(convertedFifthInt) = \(sumTuple)")
        print()

        sumTuple = 0

        print("Привязка опционалов:")

        if let convertedFirstInt = tuple.0 {
            sumTuple += convertedFirstInt
            print("\(convertedFirstInt) + ", terminator: "")
        } else {
            print("\(tuple.0) + ", terminator: "")
        }

        if let convertedSecondInt = tuple.1 {
            sumTuple += convertedSecondInt
            print("\(convertedSecondInt) + ", terminator: "")
        } else {
            print("\(tuple.1) + ", terminator: "")
        }

        if let convertedThirdInt = tuple.2{
            sumTuple += convertedThirdInt
            print("\(convertedThirdInt) + ", terminator: "")
        } else {
            print("\(tuple.2) + ", terminator: "")
        }

        if let convertedFourthInt = tuple.3 {
            sumTuple += convertedFourthInt
            print("\(convertedFourthInt) + ", terminator: "")
        } else {
            print("\(tuple.3) + ", terminator: "")
        }

        if let convertedFifthInt = tuple.4 {
            sumTuple += convertedFifthInt
            print("\(convertedFifthInt) ", terminator: "")
        } else {
            print("\(tuple.4) ", terminator: "")
        }

        print("= \(sumTuple)")
        print()
        
    }


}

