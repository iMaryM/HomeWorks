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
    @IBOutlet weak var buttonHistory: UIView!
    @IBOutlet weak var buttonRules: UIView!
    @IBOutlet weak var buttonAbout: UIView!
    
    var isNewGame = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if UserDefaults.standard.value(forKey: KeyesUserDefaults.whiteCheckerImage.rawValue) == nil {
            UserDefaults.standard.setValue("Checker_white_1", forKey: KeyesUserDefaults.whiteCheckerImage.rawValue)
        }
        
        if UserDefaults.standard.value(forKey: KeyesUserDefaults.whiteCheckerQueenImage.rawValue) == nil {
            UserDefaults.standard.setValue("Checker_white_1_queen_1", forKey: KeyesUserDefaults.whiteCheckerQueenImage.rawValue)
        }
        
        if UserDefaults.standard.value(forKey: KeyesUserDefaults.blackCheckerImage.rawValue) == nil {
            UserDefaults.standard.setValue("Checker_black_1", forKey: KeyesUserDefaults.blackCheckerImage.rawValue)
        }
        
        if UserDefaults.standard.value(forKey: KeyesUserDefaults.blackCheckerQueenImage.rawValue) == nil {
            UserDefaults.standard.setValue("Checker_black_1_queen_1", forKey: KeyesUserDefaults.blackCheckerQueenImage.rawValue)
        }
        
        decorationButton(button: buttonView, color: UIColor(red: 238 / 255, green: 233 / 255, blue: 237 / 255, alpha: 1), borderWidth: 0.5, borderColor: UIColor.white.cgColor, cornerRadius: 10, shadowColor: UIColor.lightGray.cgColor, shadowOffset: CGSize(width: 5, height: 5), shadowOpacity: 0.9)
        
        decorationButton(button: buttonViewResults, color: UIColor(red: 238 / 255, green: 233 / 255, blue: 237 / 255, alpha: 1), borderWidth: 0.5, borderColor: UIColor.white.cgColor, cornerRadius: 10, shadowColor: UIColor.lightGray.cgColor, shadowOffset: CGSize(width: 5, height: 5), shadowOpacity: 0.9)
        
        decorationButton(button: buttonViewSettings, color: UIColor(red: 238 / 255, green: 233 / 255, blue: 237 / 255, alpha: 1), borderWidth: 0.5, borderColor: UIColor.white.cgColor, cornerRadius: 10, shadowColor: UIColor.lightGray.cgColor, shadowOffset: CGSize(width: 5, height: 5), shadowOpacity: 0.9)
        
        decorationButton(button: buttonHistory, color: UIColor(red: 238 / 255, green: 233 / 255, blue: 237 / 255, alpha: 1), borderWidth: 0.5, borderColor: UIColor.white.cgColor, cornerRadius: 10, shadowColor: UIColor.lightGray.cgColor, shadowOffset: CGSize(width: 5, height: 5), shadowOpacity: 0.5)
        
        decorationButton(button: buttonRules, color: UIColor(red: 238 / 255, green: 233 / 255, blue: 237 / 255, alpha: 1), borderWidth: 0.5, borderColor: UIColor.white.cgColor, cornerRadius: 10, shadowColor: UIColor.lightGray.cgColor, shadowOffset: CGSize(width: 5, height: 5), shadowOpacity: 0.5)
        
        decorationButton(button: buttonAbout, color: UIColor(red: 238 / 255, green: 233 / 255, blue: 237 / 255, alpha: 1), borderWidth: 0.5, borderColor: UIColor.white.cgColor, cornerRadius: 10, shadowColor: UIColor.lightGray.cgColor, shadowOffset: CGSize(width: 5, height: 5), shadowOpacity: 0.5)
        
    }

    @IBAction func goToCheckersView(_ sender: Any) {
        
        guard let checkersViewController = getViewController(from: "Checkers", and: "CheckersViewController") as? CheckersViewController else { return }
        
        //проверяем есть ли файс с сохраненной игрой
        let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentDirectoryURL.appendingPathComponent("savedGame")
        
        //если файл есть то отображаем алерт
        if FileManager().fileExists(atPath: fileURL.path) {
            presentAlertController(with: nil, message: "Do you want to load saved game or start new game?", preferredStyle: .alert, actionButtons: UIAlertAction(title: "Saved game", style: .default, handler: { _ in
                
                //self.isNewGame = false
                checkersViewController.isNewGame = false
                self.navigationController?.pushViewController(checkersViewController, animated: true)
                
            }), UIAlertAction(title: "New game", style: .default, handler: { _ in
                
                checkersViewController.isNewGame = true
                self.navigationController?.pushViewController(checkersViewController, animated: true)
                
            }))
        } else {
            //если файла нет, то переходим на вью с шашками
            checkersViewController.isNewGame = true
            navigationController?.pushViewController(checkersViewController, animated: true)
        }

    }
    
    @IBAction func goToResultsView(_ sender: Any) {
        navigationController?.pushViewController(getViewController(from: "Results", and: "ResultsViewController"), animated: true)
    }
    
    @IBAction func goToSettingsView(_ sender: Any) {
        navigationController?.pushViewController(getViewController(from: "Settings", and: "SettingsViewController"), animated: true)
    }
    
    @IBAction func goToHistoryView(_ sender: Any) {
        navigationController?.pushViewController(getViewController(from: "History", and: "HistoryViewController"), animated: true)
    }
    
}

