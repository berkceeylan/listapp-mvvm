//
//  User.swift
//  ListAppMVVM
//
//  Created by Berk Ceylan on 22.02.2025.
//

import Foundation

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}
