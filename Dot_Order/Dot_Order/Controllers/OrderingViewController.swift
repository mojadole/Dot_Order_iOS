//
//  OrderingViewController.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/05/08.
//

import Foundation
import UIKit

class OrderingViewController: UIViewController {
    
    @IBOutlet weak var orderListTableView: UITableView!
    @IBOutlet weak var cookingView: UIView!
    @IBOutlet weak var firstCircleView: UIView!
    @IBOutlet weak var secondCircleView: UIView!
    @IBOutlet weak var thirdCircleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cookingView.layer.cornerRadius = 20
        firstCircleView.layer.cornerRadius = 10
        secondCircleView.layer.cornerRadius = 10
        thirdCircleView.layer.cornerRadius = 10
        
        self.navigationItem.titleView = attributeTitleView()
        self.navigationController?.navigationBar.topItem?.title = ""
        
        registerXib()
        
        orderListTableView.delegate = self
        orderListTableView.dataSource = self
        
    }
    
    private func attributeTitleView() -> UIView {
        let titleLabel: UILabel = UILabel()
        let naviTitle: NSMutableAttributedString = NSMutableAttributedString(
            string: "주문내역",
            attributes: [
                .foregroundColor: UIColor(named: "main_color")!,
                .font: UIFont(name: "SUIT-ExtraBold", size: 40)!
            ])
        
        titleLabel.attributedText = naviTitle
        
        return titleLabel
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: "PaymentTableViewCell", bundle: nil)
        self.orderListTableView.register(nibName, forCellReuseIdentifier: "paymentCell")
    }
    
}

extension OrderingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 141
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "paymentCell", for: indexPath) as! PaymentTableViewCell
        
        cell.selectionStyle = .none
        
        cell.menuNameLabel.text = "참치김밥"
        cell.countLabel.text = "2개"
        cell.priceLabel.text = "3500원"
        
        return cell
    }
    
    
}
