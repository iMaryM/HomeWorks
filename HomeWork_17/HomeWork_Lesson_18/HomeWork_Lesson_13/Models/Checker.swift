//
//  Checker.swift
//  HomeWork_Lesson_13
//
//  Created by Мария Манжос on 18.08.21.
//

import UIKit

class Checker: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var imageName: String?
    var color: Int = 0
    
    var image: UIImage? {
        get {
            return UIImage(named: self.imageName!)
        }
    }
    
    init(imageName: String, color: Int) {
        self.imageName = imageName
        self.color = color
    }
    
    override init() {
        super.init()
    }
    
    func encode(with coder: NSCoder) { //кодируем данные
        coder.encode(image, forKey: KeyesForFile.checkerImage.rawValue)
        coder.encode(color, forKey: KeyesForFile.checkerColor.rawValue)
    }
    
    required init?(coder: NSCoder) {//раскодируем данные
        self.imageName = coder.decodeObject(forKey: KeyesForFile.checkerImage.rawValue) as? String ?? ""
        self.color = coder.decodeInteger(forKey: KeyesForFile.checkerColor.rawValue)
    }
}
