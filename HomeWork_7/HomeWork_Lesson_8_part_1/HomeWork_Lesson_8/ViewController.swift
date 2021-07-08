//
//  ViewController.swift
//  HomeWork_Lesson_8
//
//  Created by Мария Манжос on 7.07.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var input_1: UITextField!
    @IBOutlet weak var input_2: UITextField!
    @IBOutlet weak var input_result: UITextField!
    @IBOutlet weak var buttonCalcSum: UIButton!
    
    @IBAction func calcSum(_ sender: Any) {
        
        if input_result.text != "" {
           input_result.text = ""
        }
        
        var result = 0
        
        if Int(input_1.text!) != nil && Int(input_2.text!) != nil {
            result = Int(input_1.text!)! + Int(input_2.text!)!
            input_result.insertText(String(result))
        } else {
            input_result.insertText("Error")
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

