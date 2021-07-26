//
//  Utils.swift
//  HomeWork_Lesson_12
//
//  Created by Мария Манжос on 26.07.21.
//

import UIKit

class UtilsViewController: UIViewController {
    static func getViewController (from id: String) -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let currentViewController = storyBoard.instantiateViewController(withIdentifier: id)
        currentViewController.modalPresentationStyle = .fullScreen
        currentViewController.modalTransitionStyle = .crossDissolve
        return currentViewController
    }
}
