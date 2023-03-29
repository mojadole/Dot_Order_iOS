//
//  MainViewController.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/03/28.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var recentMenuButton: UIButton!
    
    override func viewDidLoad() {
        
        orderButton.layer.cornerRadius = 20
        print(orderButton.titleLabel?.font)
        recentMenuButton.layer.cornerRadius = 20
        
    }
    
    
}
