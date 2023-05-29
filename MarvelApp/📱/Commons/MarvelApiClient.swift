//
//  MarvelApiClient.swift
//  MarvelApp
//
//  Created by Gigi on 5/24/23.
//

import Foundation
import CryptoKit

public enum APIServiceError: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case decodeError
}

class MarvelAPIClient {
    
    static let baseURL: String = "https://gateway.marvel.com:443/v1/public"
    
    private enum Constants {
        static let publicApiKey: String = Bundle.main.infoDictionary?["PUBLIC_API_KEY"] as? String ?? ""
        static let privateAPIKey: String = Bundle.main.infoDictionary?["PRIVATE_API_KEY"] as? String ?? ""
    }
    
    class func fetchResources<T: Decodable>(url: URL, params: [String: Any] = [:], completion: @escaping (Result<T, APIServiceError>) -> Void) {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        let timeStamp: String = NSDate().timeIntervalSince1970.description
        let hash: String =  timeStamp + Constants.privateAPIKey + Constants.publicApiKey
        var queryItems = [URLQueryItem(name: "ts", value: timeStamp),
                          URLQueryItem(name: "apikey", value: Constants.publicApiKey),
                          URLQueryItem(name: "hash", value: MD5(string: hash))]
        
        //Add Custom Params
        params.forEach { (key, value) in
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            queryItems.append(queryItem)
        }
        
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
     
        URLSession.shared.dataTask(with: url) { (result)  in
            switch result {
                case .success(let (response, data)):
                    guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                        completion(.failure(.invalidResponse))
                        return
                    }
                
                    do {
                        let values = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(values))
                    } catch {
                        completion(.failure(.decodeError))
                    }
                case .failure(_):
                    completion(.failure(.apiError))
                }
         }.resume()
    }
    
    private static func MD5(string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())

        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
