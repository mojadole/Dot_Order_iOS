//
//  RecentOrderListViewController.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/04/03.
//

import Foundation
import UIKit

class RecentOrderListViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.titleView = attributeTitleView()
        
        menuTableView.accessibilityLabel = "최근 주문 기록"
        menuTableView.accessibilityHint = "최근에 주문한 메뉴 리스트입니다"
        menuTableView.accessibilityTraits = .none
        
    }
    
    private func attributeTitleView() -> UIView {
        
        let titleLabel: UILabel = UILabel()
        let naviTitle: NSMutableAttributedString = NSMutableAttributedString(
            string: "최근 주문 내역",
            attributes: [
            .foregroundColor: UIColor(named: "main_color")!,
            .font: UIFont(name: "SUIT-ExtraBold", size: 40)!
        ])
        
        titleLabel.attributedText = naviTitle
        
        return titleLabel
    }
    
}

extension RecentOrderListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentOrderTVC", for: indexPath)
        
        return cell
    }
    
}
