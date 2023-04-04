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
        
        registerXib()
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
    }
    
    // MARK: Navigation Bar Title 세팅
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
    
    // MARK: TableViewCell Nib 등록
    private func registerXib() {
        let nibName = UINib(nibName: "RecentOrderTableViewCell", bundle: nil)
        self.menuTableView.register(nibName, forCellReuseIdentifier: "recentOrderCell")
    }
    
}

// MARK: TableView 세팅
extension RecentOrderListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 141
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recentOrderCell", for: indexPath) as! RecentOrderTableViewCell
        
        cell.shopNameLabel.text = "가게 \(indexPath.row)"
        cell.menuNameLabel.text = "메뉴 \(indexPath.row)"
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        return cell
    }
    
}
