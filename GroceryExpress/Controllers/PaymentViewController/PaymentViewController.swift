//
//  PaymentViewController.swift
//  GroceryExpress
//
//  Created by Ravi Dwivedi on 31/03/23.
//

import UIKit

class PaymentViewController: UIViewController {
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @IBAction func addYourCardButtonTapped(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier:"AddNewCardViewController") as? AddNewCardViewController else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
}

//MARK:- Data Source CollectionView
extension PaymentViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier:CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 200)
        
    }
}

//MARK:- CollectionView Delegate
extension PaymentViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.deselectItem(at: indexPath, animated: true)
    }
}

//MARK:- CollectionView FLow LayOut Delegate
extension PaymentViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

