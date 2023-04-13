//
//  ProfileViewController.swift
//  GroceryExpress
//
//  Created by Ravi Dwivedi on 21/03/23.
//

import UIKit


struct Item{
    var name:String
    var image:String
}

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    var itemArr = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
           setupUI()
    }
    
    private func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
         
        itemArr = [
                    Item(name:"", image:""),
                    Item(name:"Delivery Method", image:"order"),
                    Item(name:"Payment Method", image:"wallet"),
                    Item(name:"Help", image:"help"),
                    Item(name:"About", image:"about"),
                    Item(name:"LogOut", image:"logout")
                  ]
    }
    
}

//MARK:- TableView Data Source
extension ProfileViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier:ProfileHeaderTableViewCell.identifier, for: indexPath) as? ProfileHeaderTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
        else
        {
            guard let cell  = self.tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell   else {
                return UITableViewCell()
            }
            cell.imageVw.image = UIImage(named:itemArr[indexPath.row].image)
            cell.titleLabel.text = itemArr[indexPath.row].name
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 350.0
        }
        else
        {
            return 70.0
        }
    }
}

//MARK:- Tableview Delegate
extension ProfileViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 2 {
            navigateToPaymentView()
        }
    }
    
    private func navigateToPaymentView(){
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier:"PaymentViewController") as? PaymentViewController else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
}
