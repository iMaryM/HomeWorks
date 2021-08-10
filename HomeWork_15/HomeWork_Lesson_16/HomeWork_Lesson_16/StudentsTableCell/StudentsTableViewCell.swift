//
//  StudentsTableViewCell.swift
//  HomeWork_Lesson_16
//
//  Created by Мария Манжос on 9.08.21.
//

import UIKit

class StudentsTableViewCell: UITableViewCell {

    @IBOutlet weak var labelFIO: UILabel!
    @IBOutlet weak var labelAverageScore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
