//
//  CheckerCollectionViewCell.swift
//  HomeWork_Lesson_13
//
//  Created by Мария Манжос on 18.08.21.
//

import UIKit

class CheckerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var checkerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupImage(checkerImage: UIImage) {

        checkerImageView.image = checkerImage
        checkerImageView.contentMode = .scaleAspectFit
    }

}
