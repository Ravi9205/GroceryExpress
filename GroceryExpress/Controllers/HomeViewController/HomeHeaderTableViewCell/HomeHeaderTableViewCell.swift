//
//  HomeHeaderTableViewCell.swift
//  GroceryExpress
//
//  Created by Ravi Dwivedi on 23/03/23.
//

import UIKit

protocol HomeHeaderTableViewCellDelegate:AnyObject{
    func navigateToGroceryDetail()
}

class HomeHeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView:UICollectionView!
    static let identifier = "HomeHeaderTableViewCell"
    weak var delegate:HomeHeaderTableViewCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
    }
    
    @IBAction func seeMoreButtonTapped(_ sender: Any) {
        delegate?.navigateToGroceryDetail()
    }
}

//MARK:- CollectionView Delegate Data Source
extension HomeHeaderTableViewCell:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier:CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { fatalError("Error while Loading cell")}
        
        if indexPath.item % 2 == 0 {
            cell.backgroundColor = generateRandomColor()
        }
        else {
            cell.backgroundColor = .systemPink
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.deselectItem(at: indexPath, animated: true)
        
    }
    
    
    func generateRandomColor() -> UIColor {
        let redValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        return randomColor
    }
    
}

// CollectionView Flow Layout Delegate
extension HomeHeaderTableViewCell:UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130.0, height: 45.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
}
