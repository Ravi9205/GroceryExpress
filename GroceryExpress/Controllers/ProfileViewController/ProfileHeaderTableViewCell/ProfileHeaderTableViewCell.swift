//
//  ProfileHeaderTableViewCell.swift
//  GroceryExpress
//
//  Created by Ravi Dwivedi on 30/03/23.
//

import UIKit

class ProfileHeaderTableViewCell: UITableViewCell {
    
    static let identifier = "ProfileHeaderTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
