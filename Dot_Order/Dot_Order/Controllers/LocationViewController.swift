//
//  LocationViewController.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/03/31.
//

import Foundation
import UIKit

class LocationViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.titleView = attributeTitleView()
        
    }
    
    // MARK: NavigationBar Title 세팅
    private func attributeTitleView() -> UIView {
        
        let titleLabel: UILabel = UILabel()
        let naviTitle: NSMutableAttributedString = NSMutableAttributedString(
            string: "가게 위치 탐색",
            attributes: [
            .foregroundColor: UIColor(named: "main_color")!,
            .font: UIFont(name: "SUIT-ExtraBold", size: 40)!
        ])
        
        titleLabel.attributedText = naviTitle
        
        return titleLabel
    }
}
