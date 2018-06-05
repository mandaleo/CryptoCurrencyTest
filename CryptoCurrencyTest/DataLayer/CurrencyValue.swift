//
//  CurrencyValue.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 5/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation
import RealmSwift

class CurrencyValue: Object {
    
    @objc dynamic var coinId = 0
    @objc dynamic var priceUSD = ""
    @objc dynamic var date = ""
    
    convenience init(json: Dictionary<String, Any>, database: Realm, coinId: Int) {
        self.init()
        self.coinId = coinId
        self.priceUSD = json["price_usd"] as? String ?? "0"
        self.date = json["snapshot_at"] as? String ?? "Unknown"
    }
    
    static func fetchCurrencyValues(withCoinId coinId: Int,realm: Realm) -> Results<CurrencyValue>{
        return realm.objects(CurrencyValue.self).filter("coinId == \(coinId)").sorted(byKeyPath: "date")
    }
    
    func sameCurrencyValue(_ object: CurrencyValue) -> Bool {
        return self.coinId == object.coinId && self.priceUSD == object.priceUSD && self.date == object.date
    }
    
    static func existCurrencyValue(realm: Realm, otherCurrencyValue: CurrencyValue) -> Bool{
        let currencyValues = CurrencyValue.fetchCurrencyValues(withCoinId: otherCurrencyValue.coinId, realm: realm)
        var exist = false
        for currencyValue in currencyValues {
            if currencyValue.sameCurrencyValue(otherCurrencyValue) {
                exist = true
            }
        }
        return exist
    }
}
