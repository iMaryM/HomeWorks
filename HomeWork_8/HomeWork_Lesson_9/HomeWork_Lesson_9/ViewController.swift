//
//  ViewController.swift
//  HomeWork_Lesson_9
//
//  Created by Мария Манжос on 10.07.21.
//

import UIKit

protocol ViewControllerConection : class {
    func connectBuffer(age: Int, gender: String)
}

class ViewController: UIViewController, UITextFieldDelegate, ViewControllerConection {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!

    var attrsForButton: [NSAttributedString.Key: Any] = [.underlineStyle : NSUnderlineStyle.single.rawValue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldName.delegate = self
        let attributeString = NSMutableAttributedString(
           string: "Continue",
           attributes: attrsForButton
        )
        continueButton.setAttributedTitle(attributeString, for: .normal)
        // Do any additional setup after loading the view.
    }
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard !string.isEmpty else {
            return true
        }
        
        guard (textField.text?.count ?? 0) + string.count < 21 else{
            return false
        }
        
        switch string {
        case "A"..."Z", "a"..."z", "а"..."я", "А"..."Я":
            return true
        default:
            return false
        }
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let continueButton = continueButton else {
            return false
        }
        
        buttonNextAction(continueButton)
        return true
    }
    
    func connectBuffer(age: Int, gender: String) {
        if age > 50 && gender == "M" {
            view.backgroundColor = .red
        } else {
            if gender == "F" {
                view.backgroundColor = .yellow
            } else {
                view.backgroundColor = .green
            }
        }
    }
    
    @IBAction func buttonNextAction(_ sender: Any) {
        
        if errorLabel.text != nil {
            errorLabel.text!.removeAll()
        }
        
        if textFieldName.text == "" {
            errorLabel.text = "Error! Enter your name in textField"
            errorLabel.textColor = .red
        } else {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyBoard.instantiateViewController(withIdentifier: "ViewController_2") as? ViewController_2 {
                vc.connection = self
                vc.textName = textFieldName.text!
                vc.modalTransitionStyle = .flipHorizontal
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true, completion: nil )
            }
        }
    }
    
}

