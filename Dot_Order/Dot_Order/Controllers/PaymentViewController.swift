//
//  PaymentViewController.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/04/27.
//

import Foundation
import UIKit

class PaymentViewController: UIViewController {
    
    @IBOutlet weak var paymentTableView: UITableView!
    @IBOutlet weak var totalPriceView: UIView!
    @IBOutlet weak var changeMethodButton: UIButton!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var paymentButton: UIButton!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var shoppingList: [cartList]?
    var totalPrice: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = attributeTitleView()
        self.navigationController?.navigationBar.topItem?.title = ""
        
        totalPriceView.layer.cornerRadius = 20
        changeMethodButton.layer.cornerRadius = 20
        cardView.layer.cornerRadius = 20
        paymentButton.layer.cornerRadius = 20
        
        registerXib()
        
        APIService.shared.cartGet() { [self](response) in
            shoppingList = response
            paymentTableView.delegate = self
            paymentTableView.dataSource = self
            
            for list in response {
                totalPrice += list.price
            }
            totalPriceLabel.text = "\(totalPrice)원"
            paymentButton.titleLabel?.text = "\(totalPrice)원"
        }
    }
    
    private func attributeTitleView() -> UIView {
        let titleLabel: UILabel = UILabel()
        let naviTitle: NSMutableAttributedString = NSMutableAttributedString(
            string: "결제창",
            attributes: [
                .foregroundColor: UIColor(named: "main_color")!,
                .font: UIFont(name: "SUIT-ExtraBold", size: 40)!
            ])
        
        titleLabel.attributedText = naviTitle
        
        return titleLabel
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: "PaymentTableViewCell", bundle: nil)
        self.paymentTableView.register(nibName, forCellReuseIdentifier: "paymentCell")
    }
    
    @IBAction func paymentButtonClicked(sender: Any) {
        APIService.shared.orderPost {
            guard let orderingVC = self.storyboard?.instantiateViewController(withIdentifier: "OrderingVC") as? OrderingViewController else { return }
            orderingVC.modalPresentationStyle = .fullScreen
            self.present(orderingVC, animated: true)
        }
    }
    
}

extension PaymentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 141
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "paymentCell", for: indexPath) as! PaymentTableViewCell
        
        let menuInfo = shoppingList![indexPath.row]
        
        cell.selectionStyle = .none
        
        cell.menuNameLabel.text = menuInfo.menu_name
        cell.countLabel.text = String(menuInfo.count) + "개"
        cell.priceLabel.text = String(menuInfo.price) + "원"
        
        return cell
        
    }
    
}
