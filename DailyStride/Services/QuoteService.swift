//
//  QuoteService.swift
//  DailyStride
//
//  Created by Thomas Garayua on 10/17/24.
//

import Foundation

class QuoteService {
    func fetchRandomQuote(completion: @escaping (Result<Quote,Error>) -> Void) {
        let urlString = "https://zenquotes.io/api/random"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 404, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 404, userInfo: nil)))
                return
            }
            
            do {
                let quoteResponse = try JSONDecoder().decode([Quote].self, from: data)
                if let quote = quoteResponse.first {
                    completion(.success(quote))
                } else {
                    completion(.failure(NSError(domain: "Empty Response", code: 404, userInfo: nil)))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
