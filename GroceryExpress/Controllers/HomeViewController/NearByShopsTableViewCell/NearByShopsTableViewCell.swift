//
//  NearByShopsTableViewCell.swift
//  GroceryExpress
//
//  Created by Ravi Dwivedi on 23/03/23.
//

import UIKit

class NearByShopsTableViewCell: UITableViewCell {
    
    static let identifier = "NearByShopsTableViewCell"
    weak var delegate:HomeHeaderTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
      
    }

    @IBAction func seeMoreButtonTapped(_ sender: Any) {
        delegate?.navigateToGroceryDetail()
    }
}
