//
//  ShoppingListService.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/05/12.
//

import Foundation
import UIKit
import Alamofire

class APIService {
    
    static let shared = APIService()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let header: HTTPHeaders = ["Content-Type" : "application/json"]
    
    // MARK: 장바구니 POST
    func cartPost(_ menu: String, _ count: Int) {
        
        let url = appDelegate.baseUrl + "/cart/save"
        let params: [String: Any] = [
            "user": [
                "idx": 1
            ],
            "menu": [
                "name": menu
            ],
            "count": count
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: JSONEncoding.default,
                   headers: header
        ).responseJSON { response in
            switch response.result {
            case .success(let result):
                print("장바구니 정보 post 성공")
                print(response)
            case .failure(let error):
                print("error: \(error.localizedDescription)")
                
            }
        }
    }
    
    // MARK: 장바구니 GET
    func cartGet(completion: @escaping ([cartList]) -> Void) {
        
        let url = appDelegate.baseUrl + "/cart/" + String(appDelegate.userIdx) + "/list"
        
        AF.request(url,
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: header
        ).responseDecodable(of: [cartList].self) { response in
            switch response.result {
            case .success(let list):
                print(list)
                completion(list)
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: 장바구니 PATCH
    func cartPatch(_ menu: String, _ count: Int, completion: @escaping (cartData) -> Void) {
        
        let url = appDelegate.baseUrl + "/cart/" + String(appDelegate.userIdx) + "/update"
        let params: [String: Any] = [
            "user": [
                "idx": 1
            ],
            "menu": [
                "name": menu
            ],
            "count": count
        ]
        
        AF.request(url,
                   method: .patch,
                   parameters: params,
                   encoding: JSONEncoding.default,
                   headers: header
        ).responseDecodable(of: CartModel.self) { response in
            switch response.result {
            case .success(let cart):
                print("장바구니 정보 업데이트 성공")
                completion(cart.cartData!)
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: 주문 POST
    func orderPost() {
        let url = appDelegate.baseUrl + "/order/" + String(appDelegate.userIdx) + "/place"
        
        
    }
    
    // MARK: 주문 GET
    func orderGet(completion: @escaping (orderData) -> Void) {
        let url = appDelegate.baseUrl + "/order/" + String(appDelegate.userIdx)
        
        AF.request(url,
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: header
        ).responseDecodable(of: OrderModel.self) { response in
            switch response.result {
            case .success(let result):
                print(result.orderData)
                completion(result.orderData!)
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: 추천 메뉴 GET
    func recommendGet(_ menu: String, completion: @escaping ([String]) -> Void) {
        
        let urlStr = appDelegate.recommendUrl + menu
        guard let encodingUrl = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        let url = URL(string: encodingUrl)!
        
        AF.request(url,
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: header
        ).responseDecodable(of: [String].self) { response in
            switch response.result {
            case .success(let result):
                print(result)
                completion(result)
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            }
        }
    }
}
