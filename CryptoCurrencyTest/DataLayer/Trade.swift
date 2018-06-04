//
//  Trade.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 4/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation
import RealmSwift

class Trade: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var amount = ""
    @objc dynamic var priceUSD = ""
    @objc dynamic var coin: Coin?
    
    convenience init(json: Dictionary<String, Any>, database: Realm) {
        self.init()
        self.id = json["coin_id"] as? Int ?? 0
        self.amount = json["amount"] as? String ?? "0"
        self.priceUSD = json["price_usd"] as? String ?? "0"
        let coin = Coin.fetchCoins(realm: database, id: self.id)
        if coin != nil {
            self.coin = coin
        }else {
            _ = CoinWorker(withDatabase: database, coinId: self.id, success: nil, failure: nil)
        }
    }
    
    static func fetchTrades(realm: Realm) -> Results<Trade>{
        return realm.objects(Trade.self).sorted(byKeyPath: "id")
    }
    
    static func fetchTrades(realm: Realm, id: Int) -> Results<Trade>{
        return realm.objects(Trade.self).filter("id == \(id)")
    }
    
    static func existTrade(realm: Realm, otherTrade: Trade) -> Bool{
        let trades = Trade.fetchTrades(realm: realm)
        var exist = false
        for trade in trades {
            if trade.sameTrade(otherTrade) {
                exist = true
            }
        }
        return exist
    }
    
    static func updateCoin(realm: Realm, coin: Coin) {
        let trades = Trade.fetchTrades(realm: realm, id: coin.id)
        for trade in trades {
            trade.coin = coin
            try! realm.write {
                realm.add(coin)
            }
        }
    }
    
    func sameTrade(_ object: Trade?) -> Bool {
        return self.id == object?.id && self.amount == object?.amount && self.priceUSD == object?.priceUSD && self.coin == object?.coin
    }
}
