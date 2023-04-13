//
//  LoginViewController.swift
//  GroceryExpress
//
//  Created by Ravi Dwivedi on 21/03/23.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var semiCircleView: SemiCirleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }
    
    private func setUpUI(){
        let titleLabel = CATextLayer()
        titleLabel.frame =  CGRect(x:semiCircleView.frame.size.width / 2 - 50, y:semiCircleView.frame.size.height/2, width: 200, height: 45)
        titleLabel.string = "Log In"
        titleLabel.font = UIFont(name:"Verdana", size: 25)
        view.layer.addSublayer(titleLabel)
    }

    @IBAction func signUpButtonPressed(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier:"SignUpViewController") as? SignUpViewController else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated:false)
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        
        
    }
    @IBAction func faceBookButtonPressed(_ sender: Any) {
        
        
    }
    
    @IBAction func gmailButtonPressed(_ sender: Any) {
        
        
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
      guard let vc = self.storyboard?.instantiateViewController(withIdentifier:"LocationAccessViewController") as? LocationAccessViewController else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
}
