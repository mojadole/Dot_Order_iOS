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
    @IBOutlet weak var homeButton: UIButton!
    
    var orderList: orderData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cookingView.layer.cornerRadius = 20
        firstCircleView.layer.cornerRadius = 10
        secondCircleView.layer.cornerRadius = 10
        thirdCircleView.layer.cornerRadius = 10
        
        homeButton.accessibilityLabel = "메인 화면 버튼"
        homeButton.accessibilityHint = "앱의 첫 화면으로 돌아갑니다"
        homeButton.accessibilityTraits = .button
        
        self.navigationItem.titleView = attributeTitleView()
        self.navigationController?.navigationBar.topItem?.title = ""
        
        registerXib()
        
//        APIService.shared.orderGet() { [self](response) in
//            orderList = response
//            orderListTableView.delegate = self
//            orderListTableView.dataSource = self
//        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        
        APIService.shared.orderGet() { [self](response) in
            
            orderList = response
            orderListTableView.delegate = self
            orderListTableView.dataSource = self
            
            if response.status == "WAIT" {
                VoiceService.shared.textToSpeech("가게에서 주문을 확인 중 입니다.")
                firstCircleView.backgroundColor = UIColor(red: 255, green: 122, blue: 0, alpha: 1)
                secondCircleView.backgroundColor = UIColor(red: 217, green: 217, blue: 217, alpha: 1)
                thirdCircleView.backgroundColor = UIColor(red: 217, green: 217, blue: 217, alpha: 1)
            } else if response.status == "DOING" {
                VoiceService.shared.textToSpeech("음식이 조리 중 입니다.")
                firstCircleView.backgroundColor = UIColor(red: 217, green: 217, blue: 217, alpha: 1)
                secondCircleView.backgroundColor = UIColor(red: 255, green: 122, blue: 0, alpha: 1)
                thirdCircleView.backgroundColor = UIColor(red: 217, green: 217, blue: 217, alpha: 1)
            } else {
                VoiceService.shared.textToSpeech("조리가 완료되었습니다. 곧 음식이 나옵니다.")
                firstCircleView.backgroundColor = UIColor(red: 217, green: 217, blue: 217, alpha: 1)
                secondCircleView.backgroundColor = UIColor(red: 217, green: 217, blue: 217, alpha: 1)
                thirdCircleView.backgroundColor = UIColor(red: 255, green: 122, blue: 0, alpha: 1)
            }
        }
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
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        print("홈버튼 클릭")
        guard let mainNC = self.storyboard?.instantiateViewController(withIdentifier: "MainNC") else { return }
        mainNC.modalPresentationStyle = .fullScreen
        self.present(mainNC, animated: true)
    }
}

extension OrderingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList!.orderDetails.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 141
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "paymentCell", for: indexPath) as! PaymentTableViewCell
        
        let menu = orderList?.orderDetails[indexPath.row]
        
        cell.selectionStyle = .none
        
        cell.menuNameLabel.text = menu!.menuName
        cell.countLabel.text = "\(menu!.count) 개"
        cell.priceLabel.text = "3500원"
        
        return cell
    }
    
    
}
