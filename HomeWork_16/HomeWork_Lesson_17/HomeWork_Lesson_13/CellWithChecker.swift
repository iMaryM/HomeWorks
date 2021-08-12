//
//  Checker.swift
//  HomeWork_Lesson_13
//
//  Created by Мария Манжос on 12.08.21.
//

import UIKit

class CellWithChecker: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var positionX: CGFloat = 0
    var positionY: CGFloat = 0
    var colorOfChecker: Int = 0
    
    init(positionX: CGFloat, positionY: CGFloat, colorOfChecker: Int ) {
        self.positionX = positionX
        self.positionY = positionY
        self.colorOfChecker = colorOfChecker
    }
    
    override init() {
        super.init()
    }
    
    func encode(with coder: NSCoder) { //кодируем данные
        coder.encode(positionX, forKey: KeyesForFile.cellPositionX.rawValue)
        coder.encode(positionY, forKey: KeyesForFile.cellPositionY.rawValue)
        coder.encode(colorOfChecker, forKey: KeyesForFile.colorOfCheckerInCell.rawValue)
    }
    
    required init?(coder: NSCoder) {//раскодируем данные
        self.positionX = coder.decodeObject(forKey: KeyesForFile.cellPositionX.rawValue) as? CGFloat ?? 0
        self.positionY = coder.decodeObject(forKey: KeyesForFile.cellPositionY.rawValue) as? CGFloat ?? 0
        self.colorOfChecker = coder.decodeInteger(forKey: KeyesForFile.colorOfCheckerInCell.rawValue)
    }
}
