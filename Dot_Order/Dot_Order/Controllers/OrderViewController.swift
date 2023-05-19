//
//  OrderViewController.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/03/29.
//

import Foundation
import UIKit
import AVFoundation
import Speech

class OrderViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    @IBOutlet weak var shoppingListButton: UIButton!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var speakingButton: UIButton!
    
    var userResponse: String = ""
    var responseList: [String] = []
    
//    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "ko-KR"))
//    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
//    private var recognitionTask: SFSpeechRecognitionTask?
//    private let audioEngine = AVAudioEngine()
//    private let synthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        VoiceService.shared.speechRecognizer?.delegate = self
        
        self.navigationItem.titleView = attributeTitleView()
        
        shoppingListButton.layer.cornerRadius = 20
        shoppingListButton.accessibilityLabel = "장바구니"
        shoppingListButton.accessibilityHint = "현재 장바구니에 담긴 메뉴를 확인할 수 있는 페이지로 이동합니다"
        shoppingListButton.accessibilityTraits = .button
        shoppingListButton.addTarget(self, action: #selector(shoppingList(_:)), for: .touchUpInside)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        //VoiceService.shared.textToSpeech("원하는 메뉴명을 말씀해주세요")
    }
    
    // MARK: speaking Button Click Function
    @IBAction func speakingButtonClicked(_ sender: Any) {
        
        if VoiceService.shared.audioEngine.isRunning {
            VoiceService.shared.audioEngine.stop()
            VoiceService.shared.recognitionRequest?.endAudio()
            speakingButton.isEnabled = false
        } else {
            print("======음성인식 시작======")
            userResponse = VoiceService.shared.startRecording(speakingButton)
            responseLabel.text = userResponse
            responseList = userResponse.components(separatedBy: " ")
            print(userResponse)
        }
        
        if userResponse == "돈까스" {
            APIService.shared.recommendGet("돈까스") { response in
                VoiceService.shared.textToSpeech("해당 메뉴가 존재하지 않아 추천 메뉴 3가지를 말씀해드리겠습니다. 추천 메뉴는" + response[0] + response[1] + response[2] + "입니다.")
            }
        }
        
        if responseList.contains("주문할게") || responseList.contains("주문할께") {
            APIService.shared.cartPost("수제왕돈까스", 1)
//            { response in
//                VoiceService.shared.textToSpeech("수제왕돈까스 1개가 장바구니에 담겼습니다. 장바구니를 확인하시겠습니까?")
//            }
        }
        
    }
    
//    // MARK: startRecording Function
//    func startRecording() {
//
//        // 인식 작업이 처리 중인지 확인
//        if recognitionTask != nil {
//            recognitionTask?.cancel()
//            recognitionTask = nil
//        }
//
//        /*
//         오디오 녹음을 준비할 AVAudioSession 만들기
//         세션의 범주를 녹음, 측정 모드로 설정하고 활성화
//         이러한 속성을 설정하면 예외가 발생할 수 있으므로 try catch 절에 넣어야함
//        */
//        let audioSession = AVAudioSession.sharedInstance()
//        do {
//            try audioSession.setCategory(AVAudioSession.Category.record)
//            try audioSession.setMode(AVAudioSession.Mode.measurement)
//            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
//        } catch {
//            print("audioSession properties weren't set because of an error.")
//        }
//
//        // recognitionRequest 객체화
//        // 오디오 데이터를 Apple 서버에 전달하는 데 사용
//        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
//
//        // 장치에 녹음할 오디오 입력이 있는지 확인
//        let inputNode = audioEngine.inputNode
//
//        // recognitionRequest가 객체화 되고 nil이 아닌지 확인
//        guard let recognitionRequest = recognitionRequest else {
//            fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
//        }
//
//        // 사용자가 말할 때 인식하고 부분적인 결과를 보고하도록 설정
//        recognitionRequest.shouldReportPartialResults = false
//
//        /*
//         인식을 시작하기 위해 speechRecognizer의 recognitionTask 메서드 호출
//         완료 handler은 인식 엔진이 입력을 수신했을 때, 현재의 인식을 세련되거나 취소 또는 정지 한 때에 불려 최종 성적표를 돌려 준다.
//        */
//        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
//
//            // Bool을 정의하여 최종 인식인지 확인
//            var isFinal = false
//
//            // 결과가 nil이 아닐 경우
//            if result != nil {
//
//                // responseLabel의 text를 result의 최상의 텍스트로 설정, 결과가 최종 결과일 경우 isFinal을 true로 설정
//                self.responseLabel.text = result?.bestTranscription.formattedString
//                isFinal = (result?.isFinal)!
//            }
//
//            // 오류가 없거나 최종 결과가 나오면
//            if error != nil || isFinal {
//
//                // audioEngine(오디오 입력) 중지
//                self.audioEngine.stop()
//                inputNode.removeTap(onBus: 0)
//
//                // 인식 요청 및 인식 작업 중지
//                self.recognitionRequest = nil
//                self.recognitionTask = nil
//                self.speakingButton.isEnabled = true
//            }
//        })
//
//        /*
//         recognitionRequest에 오디오 입력 추가
//         인식 작업을 시작한 후 오디오 입력을 추가해도 됨
//         오디오 framework는 오디오 입력이 추가되는 즉시 인식 시작
//        */
//        let recordingFormat = inputNode.outputFormat(forBus: 0)
//        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
//            self.recognitionRequest?.append(buffer)
//        }
//
//        audioEngine.prepare()
//
//        do {
//            try audioEngine.start()
//        } catch {
//            print("audioEngine couldn't start because of an error.")
//        }
//
//        responseLabel.text = ""
//    }
    
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            speakingButton.isEnabled = true
        } else {
            speakingButton.isEnabled = false
        }
    }
    
//    // MARK: textToSpeech Function
//    func textToSpeech(_ text: String) {
//
//        let utterance = AVSpeechUtterance(string: text)
//        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
//        utterance.rate = 0.6
//
//        self.synthesizer.speak(utterance)
//
//    }
    
    // MARK: Navigation Bar Title 세팅
    private func attributeTitleView() -> UIView {
        
        let titleLabel: UILabel = UILabel()
        let naviTitle: NSMutableAttributedString = NSMutableAttributedString(
            string: "주문하기",
            attributes: [
            .foregroundColor: UIColor(named: "main_color")!,
            .font: UIFont(name: "SUIT-ExtraBold", size: 40)!
        ])
        
        titleLabel.attributedText = naviTitle
        
        return titleLabel
    }
    
    // MARK: 장바구니 페이지로 이동
    @objc func shoppingList(_ sender: UIButton) {
        guard let shoppingListVC = self.storyboard?.instantiateViewController(withIdentifier: "ShoppingListVC") as? ShoppingListViewController else { return }
        self.navigationController?.pushViewController(shoppingListVC, animated: true)
    }
    
}
