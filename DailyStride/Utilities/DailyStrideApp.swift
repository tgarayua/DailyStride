//
//  DailyStrideApp.swift
//  DailyStride
//
//  Created by Thomas Garayua on 10/11/24.
//

import SwiftUI

@main
struct QuoteApp: App {
    var body: some Scene {
        WindowGroup {
            let quoteService = QuoteService()
            let viewModel = QuoteViewModel(quoteService: quoteService)
            QuoteView(viewModel: viewModel)
        }
    }
}
