//
//  ViewController.swift
//  HomeWork_Lesson_13
//
//  Created by Мария Манжос on 26.07.21.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var buttonViewResults: UIView!
    @IBOutlet weak var buttonViewSettings: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        decorationButton(button: buttonView, color: UIColor(red: 238 / 255, green: 233 / 255, blue: 237 / 255, alpha: 1), borderWidth: 0.5, borderColor: UIColor.white.cgColor, cornerRadius: 10, shadowColor: UIColor.lightGray.cgColor, shadowOffset: CGSize(width: 5, height: 5), shadowOpacity: 0.9)
        
        decorationButton(button: buttonViewResults, color: UIColor(red: 238 / 255, green: 233 / 255, blue: 237 / 255, alpha: 1), borderWidth: 0.5, borderColor: UIColor.white.cgColor, cornerRadius: 10, shadowColor: UIColor.lightGray.cgColor, shadowOffset: CGSize(width: 5, height: 5), shadowOpacity: 0.9)
        
        decorationButton(button: buttonViewSettings, color: UIColor(red: 238 / 255, green: 233 / 255, blue: 237 / 255, alpha: 1), borderWidth: 0.5, borderColor: UIColor.white.cgColor, cornerRadius: 10, shadowColor: UIColor.lightGray.cgColor, shadowOffset: CGSize(width: 5, height: 5), shadowOpacity: 0.9)
        
    }

    @IBAction func goToCheckersView(_ sender: Any) {
        navigationController?.pushViewController(getViewController(from: "Checkers", and: "CheckersViewController"), animated: true)
    }
    
    @IBAction func goToResultsView(_ sender: Any) {
        navigationController?.pushViewController(getViewController(from: "Results", and: "ResultsViewController"), animated: true)
    }
    
    @IBAction func goToSettingsView(_ sender: Any) {
        navigationController?.pushViewController(getViewController(from: "Settings", and: "SettingsViewController"), animated: true)
    }
    
}

