//
//  NewTradeWorker.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 4/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation
import Alamofire

class NewTradeWorker {
    
    init(coindId: Int, amount: Double, priceUSD: Double, notes: String?, completion: @escaping () -> ()) {
        let credentialData = "richard@rich.com:secret".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString()
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Authorization": "Basic \(base64Credentials)"
        ]
        var params: Parameters   = [
            "coin_id": coindId,
            "amount": Float(amount),
            "price_usd": Float(priceUSD),
            "traded_at": Date().toIso8601()
        ];
        if let notes = notes {
            params["notes"] = notes
        }
        
        APIClient().makeRequest(method: .post, endPoint: "/portfolio", params: params, headers: headers) { (maybeJson: Dictionary<String, Any>?) in
            completion()
        }
    }
}
