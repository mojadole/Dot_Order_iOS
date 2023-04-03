//
//  OrderViewController.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/03/29.
//

import Foundation
import UIKit

class OrdreViewController: UIViewController {
    
    @IBOutlet weak var shoppingListButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.titleView = attributeTitleView()
        
        shoppingListButton.layer.cornerRadius = 20
        shoppingListButton.accessibilityLabel = "장바구니"
        shoppingListButton.accessibilityHint = "현재 장바구니에 담긴 메뉴를 확인할 수 있는 페이지로 이동합니다"
        shoppingListButton.accessibilityTraits = .button
        shoppingListButton.addTarget(self, action: #selector(shoppingList(_:)), for: .touchUpInside)
        
    }
    
    private func attributeTitleView() -> UIView {
        
        let titleLabel: UILabel = UILabel()
        let naviTitle: NSMutableAttributedString = NSMutableAttributedString(
            string: "주문하기",
            attributes: [
            .foregroundColor: UIColor(named: "main_color")!,
            .font: UIFont(name: "SUIT-ExtraBold", size: 40)!
        ])
        
        titleLabel.attributedText = naviTitle
        
        return titleLabel
    }
    
    @objc func shoppingList(_ sender: UIButton) {
        guard let shoppingListVC = self.storyboard?.instantiateViewController(withIdentifier: "ShoppingListVC") as? ShoppingListViewController else { return }
        self.navigationController?.pushViewController(shoppingListVC, animated: true)
    }
    
}
