//
//  VoiceService.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/05/19.
//

import Foundation
import AVFoundation
import Speech
import UIKit

class VoiceService {
    
    static let shared = VoiceService()
    
    let synthesizer = AVSpeechSynthesizer()
    
    // MARK: textToSpeech Function
    func textToSpeech(_ text: String) {
        
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = 0.6
        
        self.synthesizer.speak(utterance)
        
    }
    
    func stopSpeak() {
        
        self.synthesizer.stopSpeaking(at: .immediate)
        
    }
}
