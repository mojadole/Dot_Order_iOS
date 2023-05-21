//
//  OrderModel.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/05/19.
//

import Foundation

struct OrderModel: Codable {
    let success: Bool
    let message: String
    let orderData: orderData?
}

struct orderData: Codable {
    let orderIdx: Int
    let totalPrice: Int
    let status: String
    let orderDetails: [orderDetails]
}

struct orderDetails: Codable {
    let storeName: String
    let menuName: String
    let count: Int
}

struct OrderPostModel: Codable {
    let success: Bool
    let message: String
    let orderPostData: orderPostData?
}

struct orderPostData: Codable {
    let createdDate: String
    let modifiedDate: String
    let idx: Int
    let user: userInfo?
    let price: Int
    let status: String
}
