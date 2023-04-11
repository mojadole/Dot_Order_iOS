//
//  EvaluationViewController.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/04/11.
//

import Foundation
import UIKit

class EvaluationViewController: UIViewController {
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupView.layer.cornerRadius = 20
        yesButton.layer.cornerRadius = 20
        noButton.layer.cornerRadius = 20
        
    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
