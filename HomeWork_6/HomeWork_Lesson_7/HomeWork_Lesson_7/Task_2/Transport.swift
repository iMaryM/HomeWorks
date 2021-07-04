//
//  Transport.swift
//  HomeWork_Lesson_7
//
//  Created by Мария Манжос on 4.07.21.
//

import Foundation

class Transport {
    var speed: Int
    var capacity: Int
    var coastForOneKm: Int
    
    init(speed: Int, capacity: Int, coastForOneKm: Int) {
        self.speed = speed
        self.capacity = capacity
        self.coastForOneKm = coastForOneKm
    }
    
    func ship(passangers: Int, distance: Int) {
        print("Транспортное средство")
        print("Время в пути: \(Double(distance / speed))")
        print("Стоимость проезда: \((coastForOneKm * distance)/passangers)")
        print("Количество транспортных средств: \(Double(passangers / capacity).rounded(.up))")
        print()
    }
}
