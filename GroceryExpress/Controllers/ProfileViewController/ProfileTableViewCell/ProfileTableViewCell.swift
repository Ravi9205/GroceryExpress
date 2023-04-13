//
//  ProfileTableViewCell.swift
//  GroceryExpress
//
//  Created by Ravi Dwivedi on 30/03/23.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    static let identifier = "ProfileTableViewCell"
    @IBOutlet weak var imageVw:UIImageView!
    @IBOutlet weak var titleLabel:UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
