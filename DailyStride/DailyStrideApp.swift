//
//  DailyStrideApp.swift
//  DailyStride
//
//  Created by Thomas Garayua on 10/11/24.
//

import FirebaseCore
import SwiftUI

@main
struct QuoteApp: App {
    
    @State var isActive: Bool = false
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if self.isActive {
                    MainView()
                } else {
                    let quoteService = QuoteService()
                    let viewModel = QuoteViewModel(quoteService: quoteService)
                    QuoteView(viewModel: viewModel)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
