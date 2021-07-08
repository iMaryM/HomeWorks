//
//  ViewController.swift
//  HomeWork_Lesson_8_Part_2
//
//  Created by Мария Манжос on 7.07.21.
//

import UIKit

class ViewController: UIViewController {
    
    let input_1 = UITextField(frame: CGRect(x: 100, y: 150, width: 200, height: 50))
    let labelPlus = UILabel(frame: CGRect(x: 190, y: 230, width: 50, height: 50))
    let input_2 = UITextField(frame: CGRect(x: 100, y: 310, width: 200, height: 50))
    let buttonEqual = UIButton(frame: CGRect(x: 170, y: 390, width: 50, height: 50))
    let input_result = UITextField(frame: CGRect(x: 100, y: 470, width: 200, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 205 / 255, green: 175 / 255, blue: 195 / 255, alpha: 1.0)
        
        let labelTask_1 = UILabel(frame: CGRect(x: 100, y: 80, width: 200, height: 50))
        labelTask_1.text = "Task_1"
        labelTask_1.textAlignment = NSTextAlignment.center
        view.addSubview(labelTask_1)
        
//        let buttonTask_2 = UIButton(frame: CGRect(x: 100, y: 550, width: 200, height: 50))
//        buttonTask_2.setTitle("Go to Task_2", for: .normal)
//        buttonTask_2.setTitleColor(UIColor.darkGray, for: .highlighted)
//        view.addSubview(buttonTask_2)
//        buttonTask_2.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        input_1.backgroundColor = UIColor.white
        input_1.placeholder = "Enter the number"
        input_1.textAlignment = NSTextAlignment.center
        view.addSubview(input_1)
        
        labelPlus.text = "+"
        view.addSubview(labelPlus)

        input_2.backgroundColor = UIColor.white
        input_2.placeholder = "Enter the number"
        input_2.textAlignment = NSTextAlignment.center
        view.addSubview(input_2)

        buttonEqual.setTitle("=", for: .normal)
        view.addSubview(buttonEqual)
        
        input_result.backgroundColor = UIColor.white
        input_result.textAlignment = NSTextAlignment.center
        view.addSubview(input_result)
        
        buttonEqual.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
            
        }
        
        // Do any additional setup after loading the view.
    
    @objc
    func buttonTapped(_ sender: UIButton){
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
    
}

