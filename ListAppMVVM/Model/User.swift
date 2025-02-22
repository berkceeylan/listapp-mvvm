//
//  Model.swift
//  ListAppMVVM
//
//  Created by Berk Ceylan on 22.02.2025.
//
import Foundation


struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}
