//
//  APIClient.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    
    private let baseURL = "https://test.cryptojet.io"
    
    func makeRequest(method: HTTPMethod, endPoint: String, params: Parameters?, headers: HTTPHeaders?){
        guard let url = URL(string: baseURL + endPoint) else {
            return
        }
        Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
        }
    }
}
