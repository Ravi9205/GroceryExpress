//
//  SignUpViewController.swift
//  GroceryExpress
//
//  Created by Ravi Dwivedi on 21/03/23.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var semiCircleView: SemiCirleView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpUI()
    }
    
    private func setUpUI(){
        let titleLabel = CATextLayer()
        titleLabel.frame =  CGRect(x:semiCircleView.frame.size.width / 2 - 50, y:semiCircleView.frame.size.height/2, width: 200, height: 45)
        titleLabel.string = "Sign Up"
        titleLabel.font = UIFont(name:"Verdana", size: 25)
        view.layer.addSublayer(titleLabel)
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
        
    }
    
    @IBAction func gmailButtonPressed(_ sender: Any) {
        
        
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        
    }
    
    @IBAction func facebookButtonPressed(_ sender: Any) {
        
        
    }
}
