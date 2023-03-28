//
//  MainViewController.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/03/28.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var recentMenuButton: UIButton!
    
    override func viewDidLoad() {
        
        orderButton.layer.cornerRadius = 20
        recentMenuButton.layer.cornerRadius = 20
        
    }
    
    
}
