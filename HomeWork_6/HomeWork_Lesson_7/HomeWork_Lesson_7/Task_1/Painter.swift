//
//  Painter.swift
//  HomeWork_Lesson_7
//
//  Created by Мария Манжос on 4.07.21.
//

import Foundation

class Painter: Artist {
    
//    не надо, но зато теперь знаю про геттеры и сеттеры
    
//    override var firstName: String {
//        get {
//            return super.firstName
//        }
//        set(newValue) {
//            super.firstName = newValue
//        }
//    }
//
//    override var lastName: String {
//        get {
//            return super.lastName
//        }
//        set(newValue) {
//            super.lastName = newValue
//        }
//    }
    
    override func perform() {
        self.firstName = "Mr."
        self.lastName = "Picasso"
        print("Painter \(firstName) \(lastName) is drawing")
    }
}
