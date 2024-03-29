//
//  Password.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 29.03.2024.
//

import Foundation

// Keys for keychain to save bearer token
let account = "su.brf.apps.AuthSUI8"

struct BearerToken: Codable {
    let bearerToken: String
}
