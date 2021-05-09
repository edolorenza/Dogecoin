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
        static let apiKeyHeader = "X-CMC_PRO_API_KEY"
        static let baseUrl =  "https://pro-api.coinmarketcap.com/v1/"
        static let endPoint = "cryptocurrency/quotes/latest"
        static let doge = "dogecoin"
    }
    
    enum APIError: Error {
        case invalidUrl
    }
    
    public func getDogeCoinData(
        completion: @escaping (Result<DogeCoinData, Error>) -> Void
    ){
        guard let url = URL(string: Constants.baseUrl + Constants.endPoint + "?slug=" + Constants.doge) else {
            completion(.failure(APIError.invalidUrl))
            return
        }
        
        print("API URL : \(url.absoluteString)")
        
        var requests = URLRequest(url: url)
        requests.setValue(Constants.apiKey, forHTTPHeaderField: Constants.apiKeyHeader)
        requests.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: requests) {data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(APIResponse.self, from: data)
                guard let dogeCoinData = response.data.values.first else { return }
                completion(.success(dogeCoinData))
                
            }catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}




