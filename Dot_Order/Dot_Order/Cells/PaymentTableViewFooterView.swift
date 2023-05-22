//
//  PaymentTableViewFooterView.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/05/02.
//

import UIKit

class PaymentTableViewFooterView: UITableViewHeaderFooterView {

    static let FooterViewId = "totalPriceCell"
    
    var totalLabel = UILabel()
    var totalPriceLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }

    func layout() {
        
//        self.translatesAutoresizingMaskIntoConstraints = false
//        
//        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 17, left: 20, bottom: 17, right: 20))
        self.contentView.layer.cornerRadius = 20
        self.contentView.backgroundColor = UIColor(named: "main_color")
        
        self.addSubview(totalLabel)
        self.addSubview(totalPriceLabel)
        
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        totalLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
        totalLabel.font = UIFont(name: "SUIT-ExtraBold", size: 32)
        totalLabel.text = "총 결제금액"
        
        totalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        totalPriceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        totalPriceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
        totalPriceLabel.font = UIFont(name: "SUIT-ExtraBold", size: 40)
    }

}
