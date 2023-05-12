//
//  LoginModel.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/05/11.
//

import Foundation

struct LoginModel: Codable {
    let success: Bool
    let message: String
    let data: userData?
}

struct userData: Codable {
    let id: String
    let password: String
    let status: String
}
