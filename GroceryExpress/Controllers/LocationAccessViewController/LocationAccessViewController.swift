//
//  LocationAccessViewController.swift
//  GroceryExpress
//
//  Created by Ravi Dwivedi on 29/03/23.
//

import UIKit

class LocationAccessViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func useMyLocationButtonTapped(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier:"LocationViewController") as? LocationViewController else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
}
