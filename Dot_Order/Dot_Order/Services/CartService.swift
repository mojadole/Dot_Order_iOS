//
//  ShoppingListService.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/05/12.
//

import Foundation
import UIKit
import Alamofire

class CartService {
    
    func cart(_ menu: String, _ count: Int, completion: @escaping (cartData) -> Void) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let url = appDelegate.baseUrl + "/cart/save"
        let params = ["user": 1, "menu": "참치김밥", "count": 2] as Dictionary
        
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: JSONEncoding.default,
                   headers: header).responseDecodable(of: CartModel.self) { response in
            switch response.result {
            case .success(let cart):
                print("장바구니 정보 가져오기 성공")
                completion(cart.cartData!)
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    
}
