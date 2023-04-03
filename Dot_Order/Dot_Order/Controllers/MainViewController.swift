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
        recentMenuButton.layer.cornerRadius = 20
        
        orderButton.addTarget(self, action: #selector(findLocation(_:)), for: .touchUpInside)
        
    }
    
    @objc func findLocation(_ sender: UIButton) {
        guard let locationVC = (self.storyboard?.instantiateViewController(withIdentifier: "LocationVC")) else { return }
        self.navigationController?.pushViewController(locationVC, animated: true)
    }
    
}
