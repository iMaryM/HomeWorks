//
//  ViewController_2.swift
//  HomeWork_Lesson_9
//
//  Created by Мария Манжос on 10.07.21.
//

import UIKit

class ViewController_2: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var errorLabel1: UILabel!
    @IBOutlet weak var errorLabel2: UILabel!
    
    var attrsForButton: [NSAttributedString.Key: Any] = [.underlineStyle : NSUnderlineStyle.single.rawValue]
    var textName: String = ""
    weak var connection: ViewControllerConection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ageTextField.delegate = self
        genderTextField.delegate = self
        
        resultLabel.text = " Hello \(textName), please, enter the information about you: age and gender"
        resultLabel.numberOfLines = 0
        
        let attributeString = NSMutableAttributedString(
           string: "Back",
           attributes: attrsForButton
        )
        backButton.setAttributedTitle(attributeString, for: .normal)
        
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard !string.isEmpty else {
            return true
        }
        
        if textField == ageTextField {
            if let _ = Int(string), (ageTextField.text?.count ?? 0) + string.count < 4 {
                return true
            } else {
                return false
            }
        }
        
        if textField == genderTextField {
            if (genderTextField.text?.count ?? 0) + string.count < 2 {
                switch string.uppercased() {
                    case "M", "F":
                    return true
                default:
                    return false
                }
            } else {
                return false
            }
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == ageTextField {
            genderTextField.becomeFirstResponder()
        } else {
            if let backButton = backButton {
                backButtonAction(backButton)
                return true
            }
        }
        
        return false
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        
        if errorLabel1.text != nil {
            errorLabel1.text!.removeAll()
        }
        
        if errorLabel2.text != nil {
            errorLabel2.text!.removeAll()
        }
        
        guard let age = Int(ageTextField.text!) else {
            errorLabel1.text = "Error! Please, enter your age in textfield"
            errorLabel1.textColor = .red
            errorLabel1.numberOfLines = 0
            return
        }
        
        
        if genderTextField.text == "" {
            errorLabel2.text = "Error! Please, enter your gender(M/F) in textfield"
            errorLabel2.textColor = .red
            errorLabel2.numberOfLines = 0
            return
        }
    
        connection?.connectBuffer(age: age, gender: genderTextField.text!)
        dismiss(animated: true, completion: nil)
    }
    
}
