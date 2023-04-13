//
//  GroceryDetailsViewController.swift
//  GroceryExpress
//
//  Created by Ravi Dwivedi on 27/03/23.
//

import UIKit

class GroceryDetailsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var relatedProductsCollectionView:UICollectionView!
    
    @IBOutlet weak var pageController: UIPageControl!
    
    var imageArr = [String]()
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        collectionView.delegate = self
        collectionView.dataSource = self
        relatedProductsCollectionView.delegate = self
        relatedProductsCollectionView.dataSource = self
        imageArr = ["Banana","Banana","Banana"]
        // PageController  and Basic setup
        pageController.numberOfPages = imageArr.count
        pageController.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.scrollSlider), userInfo: nil, repeats: true)
        }
    }
    
   @objc private func scrollSlider(){
       if counter < imageArr.count {
           let index = IndexPath.init(item: counter, section: 0)
           self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
           counter += 1
           pageController.currentPage = counter

       }
       else
       {
           counter = 0
           let index = IndexPath.init(item: counter, section: 0)
           self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
           pageController.currentPage = counter

       }
    }
}

//MARK:- CollectionView Delegate and Data Source
extension GroceryDetailsViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.relatedProductsCollectionView {
            return 10
        }
        else
        {
            return self.imageArr.count

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.relatedProductsCollectionView {
            guard let cell = self.relatedProductsCollectionView.dequeueReusableCell(withReuseIdentifier:RelatedProductCollectionViewCell.identifier, for: indexPath) as? RelatedProductCollectionViewCell else { fatalError()}
           return cell
        }
        else
        {
            guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier:ImageSliderCollectionViewCell.identifier, for: indexPath) as? ImageSliderCollectionViewCell else { fatalError()}
            cell.imageView?.image = UIImage(named:imageArr[indexPath.item])
            return cell
        }
    }
}

//MARK:- Flow Layout  Delegate
extension GroceryDetailsViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView {
          
            return CGSize(width:self.collectionView.frame.size.width, height:self.collectionView.frame.size.height)
        }
        else
        {
            return CGSize(width: 180, height: 180)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
