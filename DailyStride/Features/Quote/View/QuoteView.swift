//
//  QuoteView.swift
//  DailyStride
//
//  Created by Thomas Garayua on 10/11/24.
//

import SwiftUI

struct QuoteView: View {
    @StateObject private var viewModel: QuoteViewModel
    
    init(viewModel: QuoteViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Text(viewModel.quoteText)
                .font(.largeTitle)
                .padding()
            
            Text("- \(viewModel.author)")
                .font(.title)
                .foregroundColor(.gray)
                .padding(.bottom)
        }
        .padding()
        .onAppear {
            viewModel.fetchQuote()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuoteView(viewModel: quote)
//    }
//}
