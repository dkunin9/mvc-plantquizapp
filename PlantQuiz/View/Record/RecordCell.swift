//
//  RecordCell.swift
//  PlantQuiz
//
//  Created by Daniel on 19.02.2021.
//

import UIKit

class RecordCell: UITableViewCell {

    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var recordBubble: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
