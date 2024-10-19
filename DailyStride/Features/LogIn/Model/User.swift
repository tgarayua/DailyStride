//
//  User.swift
//  DailyStride
//
//  Created by Thomas Garayua on 10/19/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
