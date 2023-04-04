//
//  ViewController.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/03/26.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    // MARK: 카카오 로그인 버튼
    @IBAction func kakaoLoginButton(_ sender: Any) {
        guard let mainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainNC") else { return }
        mainViewController.modalPresentationStyle = .fullScreen
        self.present(mainViewController, animated: true, completion: nil)
    }
    
}

