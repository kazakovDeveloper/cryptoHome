//
//  APICaller.swift
//  cryptoHome
//
//  Created by Kazakov Danil on 06.11.2022.
//

import Foundation


final class APICaller {
    static let shared = APICaller()
    
    private struct Constants {
        static let apiKey = "93FA3255-14BC-4355-B4EB-3948A93C3C7E"
        static let assetsEndpoint = "https://rest-sandbox.coinapi.io/v1/assets/"
    }
    
    
    private init() {}
    
    
    
    // MARK - Public
    
    
    public func getAllCryptoData(
        completion: @escaping (Result<[Crypto], Error>) -> Void
    ) {
        guard let url = URL(string: Constants.assetsEndpoint + "?apiKey=" + Constants.apiKey) else {
            return
            
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                
                completion(.success(cryptos))
            }
            catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
