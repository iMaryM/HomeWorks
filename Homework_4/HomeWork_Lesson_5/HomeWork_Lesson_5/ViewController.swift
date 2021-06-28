//
//  ViewController.swift
//  HomeWork_Lesson_5
//
//  Created by Мария Манжос on 27.06.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //task_1
        
        print("===Задание_1===")
        print()
        
        let englishAlphabet = "abcdefghijklmnopqrstuvwxyz"
        
        let characterOfAlphabet: Character = "b"
        
        print("Вариант 1: ", terminator: "")
        for (index, value) in englishAlphabet.enumerated() {
            if value == characterOfAlphabet {
                print("Символ \(characterOfAlphabet) является \(index + 1) индексом в строке \(englishAlphabet)")
                break
            }
        }
        
        print("Вариант 2: ", terminator: "")
        for index in 0..<englishAlphabet.count {
            if englishAlphabet[englishAlphabet.index(englishAlphabet.startIndex, offsetBy: index)] == characterOfAlphabet {
                print("Символ \(characterOfAlphabet) является \(index + 1) индексом в строке \(englishAlphabet)")
                break
            }
        }
        
        print()
        
        //task_2
        
        print("===Задание_2===")
        print()
        print("Вывод количества дней в месяце (без названий месяцев):")
        
        let countOfDaysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        
        for value in countOfDaysInMonth {
            print(value)
        }
        
        print()
        print("Вывод количества дней в месяце (с названиями месяцев):")
        
        let namesOfMonthes = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]
        
        for index in 0..<namesOfMonthes.count {
            
            if namesOfMonthes.count != countOfDaysInMonth.count || namesOfMonthes.isEmpty || countOfDaysInMonth.isEmpty {
                print("Ошибка вывода!")
                break
            }
            
            print("\(namesOfMonthes[index]) - \(countOfDaysInMonth[index]) день(дней)")
        }
        
        print()
        print("Вывод количества дней в месяце (кортежи) (с названиями месяцев):")
        
        let daysOfMonthes: [(nameOfMonth: String, countOfDayesInMomth: Int)] = [("Январь", 31),  ("Февраль", 28), ("Март", 31), ("Апрель", 30), ("Май", 31), ("Июнь", 30), ("Июль", 31), ("Август", 31), ("Сентябрь", 30), ("Октябрь", 31), ("Ноябрь", 30), ("Декабрь", 31)]
        
        for value in daysOfMonthes {
            print("\(value.nameOfMonth) - \(value.countOfDayesInMomth) день(дней)")
        }
        
        print()
        print("Вывод количества дней в месяце в обратном порядке (кортежи) (с названиями месяцев):")
        
        for value in daysOfMonthes.reversed() {
            print("\(value.nameOfMonth) - \(value.countOfDayesInMomth) день(дней)")
        }
        
        print()
        
        let randomDate = ("Март", 10)
        
        print("Вывод количества дней от начала года до \(randomDate): ", terminator: "")
        
        var sum = 0
        
        for value in daysOfMonthes {
            if daysOfMonthes.isEmpty || randomDate == nil {
                print("Ошибка! Массив пуст или значение не задано")
                break
            }
            
            if value.nameOfMonth == randomDate.0 {
                sum += randomDate.1
                break
            } else {
                sum += value.countOfDayesInMomth
            }
        }
        
        print(sum)
        print()
        
        //task_3
        
        print("===Задание_3===")
        print()
        
        let englishAlphabet1 = "abcdefghijklmnopqrstuvwxyz"
        
        var arrayOfString: [String] = []
        
        for index in 0..<englishAlphabet1.count {
            arrayOfString.append(String(englishAlphabet1[englishAlphabet1.index(englishAlphabet1.endIndex, offsetBy: -( index + 1))]))
        }
        
        print("Массив в обратном порядке: \(arrayOfString)")
        print()
        
        //task_4
        
        print("===Задание_4===")
        print()
        
        let someString = "Then she usually reads a book or just watches TV. My father is a doctor. He is tall and handsome. He has short dark hair and gray eyes. He is a very hardworking man. He is rather strict with us, but always fair. My elder brother Ken is thirteen, and he is very clever. He is good at Maths and always helps me with it, because I can hardly understand all these sums and problems. Ken has red hair and brown eyes. My name is Jessica. I am eleven. I have long dark hair and brown eyes. I am not as clever as my brother, though I try to do my best at school too. I am fond of dancing. Our dancing studio won The Best Dancing Studio 2015 competition last month. I am very proud of it. "
        
        var sumOfLetter = 0
        var sumOfNumber = 0
        var sumOfChar = 0
        
        for character in someString {
            switch character {
            case "a"..."z":
                sumOfLetter += 1
            case "а"..."я":
                sumOfLetter += 1
            case "0"..."9":
                sumOfNumber += 1
            case ".", ",", "?", "!", ":", ";":
                sumOfChar += 1
            default:
                break
            }
        }
        
        print("Количество букв: \(sumOfLetter)")
        print("Количество цифр: \(sumOfNumber)")
        print("Количество символов: \(sumOfChar)")
        print()
        
        //task_5
        
        print("===Задание_5===")
        print()
        
        let arr: [Int] = [1, 2, 3, 4, 5, 6, 7]
        
        func reverseArray (from arr: [Int]) -> [Int] {
            var arrTemp = arr
            for index in 0..<arr.count {
                arrTemp[index] = arr[arr.count - 1 - index]
            }
            return arrTemp
        }
        
        func reverseRange (from range: Int...) -> [Int] {
            var arrTemp: [Int] = []
            for value in range {
                arrTemp.append(value)
            }
            
            return reverseArray(from: arrTemp)
        }
        
        print("Массив: \(arr)")
        print("Массив в обратном порядке: \(reverseArray(from: arr))")
        print("Последовательность: 1, 2, 3, 4, 5, 6, 7, 8")
        print("Последовательность в обратном порядке: \(reverseRange(from: 1, 2, 3, 4, 5, 6, 7, 8))")
        print()
        
        //task_6
        
        print("===Задание_6===")
        print()

        let newString = "About 90 percent of all children attend public school, which is free. The other 10 percent go I private schools, which often include religious education."
        
        func convertStringWithTempString (at str: String) -> String {
            var strTemp: String = ""
            
            for index in 0..<str.count {
                switch str[str.index(str.startIndex, offsetBy: index)] {
                case "A", "E", "I", "O", "U", "Y", "a", "e", "i", "o", "u", "y":
                    strTemp.append(str[str.index(str.startIndex, offsetBy: index)].uppercased())
                case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Z":
                    strTemp.append(str[str.index(str.startIndex, offsetBy: index)].lowercased())
                case " ":
                    strTemp.append(str[str.index(str.startIndex, offsetBy: index)])
                case ".", ",", "?", "!", ":", ";":
                    break
                case "0":
                    strTemp.append("zero ")
                case "1":
                    strTemp.append("one ")
                case "2":
                    strTemp.append("two ")
                case "3":
                    strTemp.append("three ")
                case "4":
                    strTemp.append("four ")
                case "5":
                    strTemp.append("five ")
                case "6":
                    strTemp.append("six ")
                case "7":
                    strTemp.append("seven ")
                case "8":
                    strTemp.append("eight ")
                case "9":
                    strTemp.append("nine ")
                default:
                    break
                }
            }
            
            return strTemp
        }
        
        func convertStringWithoutTempString  (at str: String) -> String {
            var strTemp = str
            
            for index in 0..<strTemp.count {
                switch strTemp[strTemp.index(strTemp.startIndex, offsetBy: index)] {
                case "a", "e", "i", "o", "u", "y":
                    strTemp.insert(contentsOf: String(strTemp[strTemp.index(strTemp.startIndex, offsetBy: index)]).uppercased(), at: strTemp.index(strTemp.startIndex, offsetBy: index))
                    strTemp.remove(at: strTemp.index(strTemp.startIndex, offsetBy: (index + 1)))
                case "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Z":
                    print(strTemp[strTemp.index(strTemp.startIndex, offsetBy: index)])
                    strTemp.insert(contentsOf: String(strTemp[strTemp.index(strTemp.startIndex, offsetBy: index)]).lowercased(), at: strTemp.index(strTemp.startIndex, offsetBy: index))
                    strTemp.remove(at: strTemp.index(strTemp.startIndex, offsetBy: (index + 1)))
                case " ":
                    strTemp.append(str[str.index(str.startIndex, offsetBy: index)])

                default:
                    break
                }
            }
            
            strTemp = strTemp.replacingOccurrences(of: ".", with: "")
            strTemp = strTemp.replacingOccurrences(of: ",", with: "")
            strTemp = strTemp.replacingOccurrences(of: "?", with: "")
            strTemp = strTemp.replacingOccurrences(of: "!", with: "")
            strTemp = strTemp.replacingOccurrences(of: ":", with: "")
            strTemp = strTemp.replacingOccurrences(of: ";", with: "")
            
            strTemp = strTemp.replacingOccurrences(of: "0", with: "zero ")
            strTemp = strTemp.replacingOccurrences(of: "1", with: "one ")
            strTemp = strTemp.replacingOccurrences(of: "2", with: "two ")
            strTemp = strTemp.replacingOccurrences(of: "3", with: "three ")
            strTemp = strTemp.replacingOccurrences(of: "4", with: "four ")
            strTemp = strTemp.replacingOccurrences(of: "5", with: "five ")
            strTemp = strTemp.replacingOccurrences(of: "6", with: "six ")
            strTemp = strTemp.replacingOccurrences(of: "7", with: "seven ")
            strTemp = strTemp.replacingOccurrences(of: "8", with: "eight ")
            strTemp = strTemp.replacingOccurrences(of: "9", with: "nine ")
            
            return strTemp
        }
        
        print("Вариант 1 (с записью в новую строку): \(convertStringWithTempString(at: newString))")
        
        print("Вариант 2 (с редактированием строки): \(convertStringWithoutTempString(at: newString))")
        print()
        
        //task_7
        
        print("===Задание_7===")
        print()
        
        let arr1 = [23, 55, 8, 73, 90, -5, 8, 123]
        
        func fintMaxValueInArray (in arr: [Int]) -> Int {
            var max = arr[0]
        
            for index in 0..<arr.count {
                if max < arr[index] {
                    max = arr[index]
                }
            }
            return max
        }
        
        print("Максимальное значение в массиве \(arr1): \(fintMaxValueInArray(in: arr1))")
        print()
        
        //task_8
        
        print("===Задание_8===")
        print()
        
        let arr2 = [45, 88, 98, 5, 19, 23, 55, 77, 2]
        
        func searchOddAndEvenNumber (in arr: [Int]) -> [Bool] {
            var arrTemp: [Bool] = []
            for value in arr {
                if value % 2 == 0 {
                    arrTemp.append(true)
                } else {
                    arrTemp.append(false)
                }
            }
            
            return arrTemp
        }
        
        print("Массив: \(arr2)")
        print("Результат работы фукнции по определению четных и нечетных чисел в массиве: \(searchOddAndEvenNumber(in: arr2))")
        print()
        
    }

}

