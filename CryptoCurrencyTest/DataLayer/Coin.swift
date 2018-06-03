//
//  Coin.swift
//  CryptoCurrencyTest
//
//  Created by Manuel Martinez Gomez on 3/6/18.
//  Copyright © 2018 Mandaleo. All rights reserved.
//

import Foundation
import RealmSwift

class Coin: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var symbol = ""
    //var logo= Any
    @objc dynamic var rank = 0
    @objc dynamic var price_usd = ""
    @objc dynamic var price_btc = ""
    @objc dynamic var volume_usd = 0.0
    @objc dynamic var market_cap_usd = 0.0
    @objc dynamic var available_supply = 0.0
    @objc dynamic var total_supply = 0.0
    @objc dynamic var percent_change_1h = ""
    @objc dynamic var percent_change_24h = ""
    @objc dynamic var percent_change_7d = ""
    @objc dynamic var created_at = ""
    @objc dynamic var updated_at = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(json: Dictionary<String, Any>) {
        self.init()
        self.id = json["id"] as? Int ?? 0
        self.name = json["name"] as? String ?? "Not available"
        self.symbol = json["symbol"] as? String ?? "Not available"
        self.rank = json["rank"] as? Int ?? 0
        self.price_usd = json["price_usd"] as? String ?? "Not available"
        self.price_btc = json["price_btc"] as? String ?? "Not available"
        self.volume_usd = json["24h_volume_usd"] as? Double ?? 0.0
        self.market_cap_usd = json["market_cap_usd"] as? Double ?? 0.0
        self.available_supply = json["available_supply"] as? Double ?? 0.0
        self.total_supply = json["total_supply"] as? Double ?? 0.0
        self.percent_change_1h = json["percent_change_1h"] as? String ?? "Not available"
        self.percent_change_24h = json["percent_change_24h"] as? String ?? "Not available"
        self.percent_change_7d = json["percent_change_7d"] as? String ?? "Not available"
        self.created_at = json["created_at"] as? String ?? "Not available"
        self.updated_at = json["updated_at"] as? String ?? "Not available"
    }
    
    
    static func fetchCoins(realm: Realm) -> Results<Coin>{
        return realm.objects(Coin.self).sorted(byKeyPath: "id")
    }
    
    static func fetchCoins(realm: Realm, id: Int) -> Coin? {
        return fetchCoins(realm: realm).filter("id == \(id)").first
    }
}
