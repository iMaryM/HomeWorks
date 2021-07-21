//
//  ViewController.swift
//  HomeWork_Lesson_11
//
//  Created by Мария Манжос on 20.07.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var roundedButton: [UIButton]!
    @IBOutlet weak var buttonZero: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        for value in roundedButton {
            value.layer.cornerRadius = value.bounds.size.width / 2.0
            value.clipsToBounds = true
        }
        
        buttonZero.layer.cornerRadius = buttonZero.bounds.size.width / 5.0
        
    }

}

