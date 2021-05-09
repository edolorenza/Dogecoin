//
//  APICaller.swift
//  Dogecoin
//
//  Created by Edo Lorenza on 09/05/21.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    private init() {}
    
    struct Constants {
        static let apiKey = "414826fd-e145-4e71-8ed5-48361598c97f"
        static let apiKeyHeader = "CMC_PRO_API_KEY"
        static let baseUrl =  "https://pro-api.coinmarketcap.com/v1"
        static let endPoint = "cryptocurrency/quotes/latest"
        static let doge = "dogecoin"
    }
}
