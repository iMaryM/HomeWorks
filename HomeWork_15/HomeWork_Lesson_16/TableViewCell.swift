//
//  TableViewCell.swift
//  Lesson_16_App
//
//  Created by Мария Манжос on 8.08.21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        labelCell.text = ""
    }
}
 
