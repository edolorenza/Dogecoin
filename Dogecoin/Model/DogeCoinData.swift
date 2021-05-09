//
//  Models.swift
//  Dogecoin
//
//  Created by Edo Lorenza on 09/05/21.
//

import Foundation

struct APIResponse: Codable {
    let data: [Int: DogeCoinData]
}


struct DogeCoinData: Codable {
    let id: Int
    let name: String
    let symbol: String
}


/*
 
 
 "data": {
     "74": {
     "id": 74,
     "name": "Dogecoin",
     "symbol": "DOGE",
     "slug": "dogecoin",
     "num_market_pairs": 354,
     "date_added": "2013-12-15T00:00:00.000Z",
     "tags": [
     "mineable",
     "pow",
     "scrypt",
     "medium-of-exchange",
     "memes",
     "payments"
 ],
     "max_supply": null,
     "circulating_supply": 129517138098.99327,
     "total_supply": 129517138098.99327,
     "is_active": 1,
     "platform": null,
     "cmc_rank": 4,
     "is_fiat": 0,
     "last_updated": "2021-05-09T08:33:03.000Z",
     "quote": {
     "USD": {
     "price": 0.53154990873091,
     "volume_24h": 33324527152.883797,
     "percent_change_1h": -0.90864313,
     "percent_change_24h": -24.49364551,
     "percent_change_7d": 44.29845952,
     "percent_change_30d": 756.85697691,
     "percent_change_60d": 837.60412828,
     "percent_change_90d": 651.9324751,
     "market_cap": 68844822935.60854,
     "last_updated": "2021-05-09T08:33:03.000Z"
    }
 }
 }
 }
 }
 */
