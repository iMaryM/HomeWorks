//
//  ViewController.swift
//  HomeWork_Lesson_7
//
//  Created by Мария Манжос on 4.07.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //task_1
        
        print("___Task_1___")
        let dancer = Dancer(firstName: "Anna", lastName: "Pavlova")
        let singer = Singer(firstName: "Frank", lastName: "Sinatra")
        let painter = Painter(firstName: "Jackson", lastName: "Pollock")
        
        let arr: [Artist] = [dancer, singer, painter]
        
        for value in arr {
            value.perform()
        }
        print()
        
        //task_2
        
        print("___Task_2___")
        let plane = Plane(speed: 800, capacity: 150, coastForOneKm: 50)
        let ship = Ship(speed: 200, capacity: 1000, coastForOneKm: 20)
        let helicopter = Helicopter(speed: 400, capacity: 4, coastForOneKm: 30)
        let car = Car(speed: 150, capacity: 5, coastForOneKm: 15)
        
        let arr1: [Transport] = [plane, ship, helicopter, car]
        
        for value in arr1 {
            value.ship(passangers: 1600, distance: 10000)
        }
        
        //task_3
        print("___Task_3___")
        let human = Human()
        let human1 = Human()
        let crocodile = Crocodile()
        let monkey = Monkey()
        let dog = Dog()
        let dog1 = Dog()
        let dog2 = Dog()
        let giraffe = Giraffe()
        
        let arr2: [Animal] = [human, human1, crocodile, monkey, dog, dog1, dog2, giraffe]
        
        var sumOfFourLegs = 0
        var sumOfAnimals = 0
        var sumOfAlives = 0
        
        for value in arr2 {
            if value.isFourLegs {
                sumOfFourLegs += 1
            }
            if value.isAnimal {
                sumOfAnimals += 1
            }
            if value.isAlive {
                sumOfAlives += 1
            }
        }
        
        print("Количество четвероногих: \(sumOfFourLegs)")
        print("Количество животных: \(sumOfAnimals)")
        print("Количество живых существ: \(sumOfAlives)")
        
    }

}

