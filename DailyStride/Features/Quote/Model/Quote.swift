//
//  Quote.swift
//  DailyStride
//
//  Created by Thomas Garayua on 10/11/24.
//

import Foundation

struct Quote: Codable {
    var q: String
    var a: String
    var h: String
}

enum CodingKeys: String, CodingKey {
    case quote = "q"
    case authorName = "a"
    case formattedQuote = "h"
}
