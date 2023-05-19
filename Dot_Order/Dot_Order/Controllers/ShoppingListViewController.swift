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
    @IBOutlet weak var modifyButton: UIButton!
    @IBOutlet weak var payButton: UIButton!
    
    var shoppingList: [cartList]?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        modifyButton.layer.cornerRadius = 15
        payButton.layer.cornerRadius = 15
        
        self.navigationItem.titleView = attributeTitleView()
        self.navigationController?.navigationBar.topItem?.title = ""
        
        shoppingListTableView.accessibilityLabel = "장바구니 리스트"
        shoppingListTableView.accessibilityHint = "현재 장바구니에 담긴 메뉴들 리스트입니다"
        shoppingListTableView.accessibilityTraits = .none
    
        registerXib()
        
        APIService.shared.cartGet { [self](response) in
            shoppingList = response
            shoppingListTableView.dataSource = self
            shoppingListTableView.delegate = self
        }
        
    }
    
    // MARK: Navigation Bar Title 세팅
    private func attributeTitleView() -> UIView {
        
        let titleLabel: UILabel = UILabel()
        let naviTitle: NSMutableAttributedString = NSMutableAttributedString(
            string: "장바구니",
            attributes: [
            .foregroundColor: UIColor(named: "main_color")!,
            .font: UIFont(name: "SUIT-ExtraBold", size: 40)!
        ])
        
        titleLabel.attributedText = naviTitle
        
        return titleLabel
    }
    
    // MARK: TableViewCell Nib 등록
    private func registerXib() {
        let nibName = UINib(nibName: "ShoppingListTableViewCell", bundle: nil)
        self.shoppingListTableView.register(nibName, forCellReuseIdentifier: "shoppingListCell")
    }
    
    @IBAction func modifyBtnClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func payBtnClicked(_ sender: Any) {
        guard let paymentVC = self.storyboard?.instantiateViewController(withIdentifier: "PaymentVC") as? PaymentViewController else { return }
        navigationController?.pushViewController(paymentVC, animated: true)
    }
    
}

// MARK: TableView 세팅
extension ShoppingListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 141
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell", for: indexPath) as! ShoppingListTableViewCell
        
        let menuInfo = shoppingList![indexPath.row]
        
        cell.countLabel.text = String(menuInfo.count)
        cell.menuNameLabel.text = menuInfo.menu_name
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
