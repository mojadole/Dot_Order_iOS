//
//  ShoppingListViewController.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/04/03.
//

import Foundation
import UIKit

class ShoppingListViewController: UIViewController {
    
    @IBOutlet weak var shoppingListTableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        shoppingListTableView.accessibilityLabel = "장바구니 리스트"
        shoppingListTableView.accessibilityHint = "현재 장바구니에 담긴 메뉴들 리스트입니다"
        shoppingListTableView.accessibilityTraits = .none
    }
    
}

extension ShoppingListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingListTVC", for: indexPath)
        
        return cell
    }
    
    
}
