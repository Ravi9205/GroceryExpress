//
//  BestSellingProductTableViewCell.swift
//  GroceryExpress
//
//  Created by Ravi Dwivedi on 23/03/23.
//

import UIKit

class BestSellingProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView:UICollectionView!
    weak var delegate:HomeHeaderTableViewCellDelegate?
    
    static let identifier = "BestSellingProductTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    @IBAction func seeMoreButtonTapped(_ sender: Any) {
        delegate?.navigateToGroceryDetail()
    }
}

//MARK:- CollectionView Delegate Data Source
extension BestSellingProductTableViewCell:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier:BestSellingProductCollectionViewCell.identifier, for: indexPath) as? BestSellingProductCollectionViewCell else { fatalError("Error while Loading cell")}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.deselectItem(at: indexPath, animated: true)
    }
    
}

// CollectionView Flow Layout Delegate
extension BestSellingProductTableViewCell:UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200.0, height: 250.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}
