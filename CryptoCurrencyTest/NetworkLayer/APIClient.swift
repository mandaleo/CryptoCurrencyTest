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
    
    
    /// Base comunication method using Alamofire
    ///
    /// - Parameters:
    ///   - method: (required) <- "GET", "POST", "PUT", "PATCH","DELETE"
    ///   - endPoint: (required) <- String with the endpoint of the server
    ///   - params: (optiona) <- Array of params to inject in body request
    ///   - headers: (optiona) <- Array of headers to inject in header of the request
    ///   - success: (optiona) <- completion to execute when request is OK
    ///   - failure: (optiona) <- completion to execute when request is OK
    func makeRequest(method: HTTPMethod, endPoint: String, params: Parameters?, headers: HTTPHeaders?, success:@escaping (Dictionary<String, Any>?)-> (), failure:@escaping (Error)-> ()){
        guard let url = URL(string: baseURL + endPoint) else {
            return
        }
        print(url)
        Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
                case .success(let json):
                    if let dict = json as? Dictionary<String, Any> {
                        success(dict)
                    }else {
                        failure(NSError())
                    }
                    break
                case .failure(let error):
                    failure(error)
                    break
            }
        }
    }
}
