//
//  Human.swift
//  HomeWork_Lesson_7
//
//  Created by Мария Манжос on 4.07.21.
//

import Foundation

class Human: Animal {
    override init() {
        super.init()
        self.isFourLegs = false
        self.isAnimal = false
        self.isAlive = true
    }
}
