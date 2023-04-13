//
//  HomeViewController.swift
//  GroceryExpress
//
//  Created by Ravi Dwivedi on 21/03/23.
//

import UIKit



enum CellType{
    case header
    case bestSeller
    case nearByShop
}

struct Section {
    var type:CellType
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    var sectionArr = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIComponent()
    }
    
    
    private func setUpUIComponent(){
        tableView.delegate = self
        tableView.dataSource = self
        sectionArr = [Section(type: .header),Section(type: .bestSeller),Section(type: .nearByShop)]
    }
    
    private func gotoGroceryDetails(){
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier:"GroceryDetailsViewController") as? GroceryDetailsViewController else { fatalError()}
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
}

//MARK:- TableView Delegate Data source
extension HomeViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch sectionArr[indexPath.row].type{
        case .header:
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier:HomeHeaderTableViewCell.identifier, for: indexPath) as? HomeHeaderTableViewCell else { fatalError()}
            cell.delegate = self
            return cell
            
        case .bestSeller:
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier:BestSellingProductTableViewCell.identifier, for: indexPath) as? BestSellingProductTableViewCell else { fatalError()}
            cell.delegate = self
            return cell
            
        case .nearByShop:
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier:NearByShopsTableViewCell.identifier, for: indexPath) as? NearByShopsTableViewCell else { fatalError()}
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sectionArr[indexPath.row].type {
        case .header:
            return 380.0
        case .bestSeller:
            return 320.0
        case .nearByShop:
            return 280.0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

//MARK:- CustomDelegate HomeHeaderTableViewCellDelegate
extension HomeViewController:HomeHeaderTableViewCellDelegate{
    func navigateToGroceryDetail() {
        self.gotoGroceryDetails()
    }
}

