//
//  ListCoinsWorker.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation
import Alamofire

class ListCoinsWorker {
    
    init(withPage page: Int) {
        let params: Parameters   = ["page": page];
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        APIClient().makeRequest(method: .get, endPoint: "/coins", params: params, headers: headers)
    }
}
