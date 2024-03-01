//
//  NetworkManager.swift
//  RandomUser
//
//  Created by barufe on 1/03/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    var isConnected: Bool = true
    private init() { }
}
