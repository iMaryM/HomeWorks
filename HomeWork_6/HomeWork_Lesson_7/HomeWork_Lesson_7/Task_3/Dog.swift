//
//  Dog.swift
//  HomeWork_Lesson_7
//
//  Created by Мария Манжос on 5.07.21.
//

import Foundation

class Dog: Animal {
    override init() {
        super.init()
        self.isFourLegs = true
        self.isAnimal = true
        self.isAlive = true
    }
}
