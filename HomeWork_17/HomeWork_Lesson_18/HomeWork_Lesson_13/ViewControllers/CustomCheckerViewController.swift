//
//  CustomCheckerViewController.swift
//  HomeWork_Lesson_13
//
//  Created by Мария Манжос on 18.08.21.
//

import UIKit

class CustomCheckerViewController: UIViewController {

    @IBOutlet weak var whiteCheckersCollectionView: UICollectionView!

    var whiteCheckersImageName = ["Checker_white_1", "Checker_white_2", "Checker_white_3", "Checker_white_4", "Checker_white_5", "Checker_white_6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupWhiteCheckersCollectionView()
    }
    
    func setupWhiteCheckersCollectionView() {
        whiteCheckersCollectionView.delegate = self
        whiteCheckersCollectionView.dataSource = self
        whiteCheckersCollectionView.register(UINib(nibName: "CheckerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CheckerCollectionViewCell")
    }
    
    @IBAction func goToPreViewController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension CustomCheckerViewController: UICollectionViewDelegate {

}

extension CustomCheckerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        whiteCheckersImageName.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = whiteCheckersCollectionView.dequeueReusableCell(withReuseIdentifier: "CheckerCollectionViewCell", for: indexPath) as? CheckerCollectionViewCell else {
            return UICollectionViewCell()
        }

        if UserDefaults.standard.string(forKey: KeyesUserDefaults.whiteCheckerImage.rawValue) == whiteCheckersImageName[indexPath.row] {
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = cell.frame.height / 2
            cell.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).cgColor
            cell.layer.shadowOffset = CGSize(width: 120, height: 120)
            cell.layer.shadowOpacity = 0.9
            cell.backgroundColor = .darkGray
        }
        
        cell.setupImage(checkerImage: UIImage(named: whiteCheckersImageName[indexPath.row])!)
        return cell
    }
    
}
