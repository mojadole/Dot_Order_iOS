//
//  MainViewController.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/03/28.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var recentMenuButton: UIButton!
    @IBOutlet weak var orderingButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setNavigationBar()
        
        logoImageView.isAccessibilityElement = false
        orderButton.layer.cornerRadius = 20
        recentMenuButton.layer.cornerRadius = 20
        orderingButton.layer.cornerRadius = 20
        
        orderButton.accessibilityLabel = "주문하기"
        orderButton.accessibilityHint = "메뉴를 주문하기 위한 페이지로 이동합니다"
        orderButton.accessibilityTraits = .button
        orderButton.addTarget(self, action: #selector(findLocation(_:)), for: .touchUpInside)
        
        recentMenuButton.accessibilityLabel = "최근 주문 내역"
        recentMenuButton.accessibilityHint = "최근 주문한 내역들을 확인하는 페이지로 이동합니다"
        recentMenuButton.accessibilityTraits = .button
        recentMenuButton.addTarget(self, action: #selector(recentOrder(_:)), for: .touchUpInside)
        
        orderingButton.accessibilityLabel = "현재 주문 상황 확인"
        orderingButton.accessibilityHint = "현재 주문 상황을 확인할 수 있는 페이지로 이동합니다"
        orderingButton.accessibilityTraits = .button
        orderingButton.addTarget(self, action: #selector(ordering(_:)), for: .touchUpInside)
        
    }
    
    // MARK: NavigationBar Back Button 세팅 함수
    private func setNavigationBar() {
        
        let backButtonImage: UIImage = UIImage(named: "back_icon")!
            .resized(to: CGSize(width: 40, height: 40))
            .withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
        self.navigationController?.navigationBar.backIndicatorImage = backButtonImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        
        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backButtonItem
    }
    
    //가게 위치 탐색 페이지로 이동
    @objc func findLocation(_ sender: UIButton) {
        guard let locationVC = self.storyboard?.instantiateViewController(withIdentifier: "LocationVC") else { return }
        self.navigationController?.pushViewController(locationVC, animated: true)
    }
    
    //최근 주문 메뉴 리스트 페이지로 이동
    @objc func recentOrder(_ sender: UIButton) {
        guard let recentOrderVC = self.storyboard?.instantiateViewController(withIdentifier: "RecentOrderVC") else { return }
        self.navigationController?.pushViewController(recentOrderVC, animated: true)
    }
    
    //현재 주문 상황 페이지로 이동
    @objc func ordering(_ sender: UIButton) {
        guard let orderingVC = self.storyboard?.instantiateViewController(withIdentifier: "OrderingVC") else { return }
        orderingVC.modalPresentationStyle = .fullScreen
        self.present(orderingVC, animated: true)
    }
    
}

// MARK: UIImage resize 함수
extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        let newWidth = size.width
        let newHeight = size.height
        let newImageRect = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: newImageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    
}
