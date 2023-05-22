//
//  ShoppingListModel.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/05/12.
//

import Foundation

struct CartModel: Codable {
    let success: Bool
    let message: String
    let cartData: cartData?
}

struct cartData: Codable {
    let createdDate: String
    let modifiedDate: String
    let idx: Int
    let user: userInfo
    let menu: menuInfo
    let count: Int
    let price: Int
}

struct userInfo: Codable {
    let idx: Int
    let id: String
    let password: String
    let status: String
}

struct menuInfo: Codable {
    let idx: Int
    let store: storeInfo
    let name: String
    let price: Int
}

struct storeInfo: Codable {
    let idx: Int
    let name: String
    let gps: String
}

struct CartListModel: Codable {
    let success: Bool
    let message: String
    let cartList: [cartList]
}

struct cartList: Codable {
    let menu_name: String
    let count: Int
    let price: Int
}
