//
//  Artist.swift
//  HomeWork_Lesson_7
//
//  Created by Мария Манжос on 4.07.21.
//

import Foundation

class Artist {
    var firstName: String
    
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func perform() {
        print("Artist \(firstName) \(lastName) is performing")
    }
}
