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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = attributeTitleView()
        self.navigationController?.navigationBar.topItem?.title = ""
        
        totalPriceView.layer.cornerRadius = 20
        changeMethodButton.layer.cornerRadius = 20
        cardView.layer.cornerRadius = 20
        paymentButton.layer.cornerRadius = 20
        
        registerXib()
        
        paymentTableView.delegate = self
        paymentTableView.dataSource = self
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
        guard let orderingVC = self.storyboard?.instantiateViewController(withIdentifier: "OrderingVC") as? OrderingViewController else { return }
        self.navigationController?.pushViewController(orderingVC, animated: true)
    }
    
}

extension PaymentViewController: UITableViewDelegate, UITableViewDataSource {
    
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
