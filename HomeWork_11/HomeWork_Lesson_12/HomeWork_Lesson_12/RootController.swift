//
//  ViewController.swift
//  HomeWork_Lesson_12
//
//  Created by Мария Манжос on 22.07.21.
//

import UIKit

class RootController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
    }

    @IBAction func goToCheckersView(_ sender: Any) {
        self.navigationController?.pushViewController(UtilsViewController.getViewController(from: "CheckersController"), animated: true)
    }
    
}

