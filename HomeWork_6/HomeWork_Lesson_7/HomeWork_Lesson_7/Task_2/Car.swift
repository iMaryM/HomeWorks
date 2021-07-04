//
//  Car.swift
//  HomeWork_Lesson_7
//
//  Created by Мария Манжос on 4.07.21.
//

import Foundation

class Car: Transport {
    override init(speed: Int, capacity: Int, coastForOneKm: Int) {
        super.init(speed: speed, capacity: capacity, coastForOneKm: coastForOneKm)
    }
    
    override func ship(passangers: Int, distance: Int) {
        print("Транспортное средство: Машина")
        print("Время в пути: \(Double(distance) / Double(speed))")
        print("Стоимость проезда: \((Double(coastForOneKm) * Double(distance)) / Double (passangers))")
        print("Количество транспортных средств: \((Double(passangers) / Double(capacity)).rounded(.up))")
        print()
    }
}
