//
//  UserEntity.swift
//  RandomUser
//
//  Created by barufe on 28/02/24.
//

import Foundation

// MARK: - Response
struct Response {
    let results: [User]
    let info: Info
}

// MARK: - Info
struct Info {
    let seed: String
    let results, page: Int
    let version: String
}

// MARK: - User
struct User {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob, registered: Dob
    let phone, cell: String
    let id: ID
    let picture: Picture
    let nat: String
}

// MARK: - Dob
struct Dob {
    let date: String
    let age: Int
}

// MARK: - ID
struct ID {
    let name, value: String
}

// MARK: - Location
struct Location {
    let street: Street
    let city, state, country, postcode: String
    let coordinates: Coordinates
    let timezone: Timezone
}

// MARK: - Coordinates
struct Coordinates {
    let latitude, longitude: String
}

// MARK: - Street
struct Street {
    let number: Int
    let name: String
}

// MARK: - Timezone
struct Timezone {
    let offset, description: String
}

// MARK: - Login
struct Login {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}

// MARK: - Name
struct Name {
    let title, first, last: String
}

// MARK: - Picture
struct Picture {
    let large, medium, thumbnail: String
}
