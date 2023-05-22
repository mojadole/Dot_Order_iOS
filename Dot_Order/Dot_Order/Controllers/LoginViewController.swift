//
//  ViewController.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/03/26.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var idView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 20
        
        idView.layer.cornerRadius = 15
        idView.layer.borderWidth = 3
        idView.layer.borderColor = UIColor(named: "main_color")?.cgColor
        
        passwordView.layer.cornerRadius = 15
        passwordView.layer.borderWidth = 3
        passwordView.layer.borderColor = UIColor(named: "main_color")?.cgColor
        
        passwordTextField.isSecureTextEntry = true
        
    }
    
    
    // MARK: 로그인 버튼
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let mainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainNC") else { return }
        mainViewController.modalPresentationStyle = .fullScreen
        self.present(mainViewController, animated: true, completion: nil)
    }
    
}

