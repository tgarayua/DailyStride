//
//  QuoteViewModel.swift
//  DailyStride
//
//  Created by Thomas Garayua on 10/17/24.
//

import Foundation

class QuoteViewModel: ObservableObject {
    @Published var quoteText: String = ""
    @Published var formattedQuote: String = "Loading..."
    @Published var author: String = ""
    
    private let quoteService: QuoteService
    
    init(quoteService: QuoteService) {
        self.quoteService = quoteService
    }
    
    func fetchQuote() {
        quoteService.fetchRandomQuote { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let quote):
                    self?.quoteText = quote.q
                    self?.formattedQuote = quote.h
                    self?.author = quote.a
                case .failure:
                    self?.quoteText = "Failed to load quote"
                    self?.formattedQuote = "Failed to load quote"
                    self?.author = "Failed to load author"
                }
            }
        }
    }
}
