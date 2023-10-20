//
//  LocationViewController.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/03/31.
//

import UIKit
import AVFoundation
import Speech

class LocationViewController: UIViewController {
    
    @IBOutlet weak var researchButton: UIButton!
    @IBOutlet weak var orderButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.titleView = attributeTitleView()
        researchButton.layer.cornerRadius = 20
        orderButton.layer.cornerRadius = 20
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        VoiceService.shared.textToSpeech("현재 위치를 확인 중 입니다")
        
        sleep(4)
        
        VoiceService.shared.textToSpeech("현재 위치는 김밥천국 세종대점입니다. 주문을 진행하시려면 주문 버튼을, 위치 재검색을 하시려면 재검색 버튼을 누르세요")
        
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
    
    @IBAction func orderButtonClicked(_ sender: Any) {
        VoiceService.shared.stopSpeak()
        
        guard let orderVC = self.storyboard?.instantiateViewController(withIdentifier: "OrderVC") as? OrderViewController else { return }
        self.navigationController?.pushViewController(orderVC, animated: true)
    }
}
