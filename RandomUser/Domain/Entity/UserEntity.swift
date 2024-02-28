//
//  UserEntity.swift
//  RandomUser
//
//  Created by barufe on 28/02/24.
//

import Foundation

// MARK: - User
struct UserEntity {
    let gender: String
    let name: NameEntity
    let location: LocationEntity
    let email: String
    let login: LoginEntity
    let dob, registered: DobEntity
    let phone, cell: String
    let id: IDEntity
    let picture: PictureEntity
    let nat: String
}

// MARK: - Dob
struct DobEntity {
    let date: String
    let age: Int
}

// MARK: - IDEntity
struct IDEntity {
    let name, value: String
}

// MARK: - LocationEntity
struct LocationEntity {
    let street: StreetEntity
    let city, state, country, postcode: String
    let coordinates: CoordinatesEntity
    let timezone: TimezoneEntity
}

// MARK: - CoordinatesEntity
struct CoordinatesEntity {
    let latitude, longitude: String
}

// MARK: - StreetEntity
struct StreetEntity {
    let number: Int
    let name: String
}

// MARK: - TimezoneEntity
struct TimezoneEntity {
    let offset, description: String
}

// MARK: - LoginEntity
struct LoginEntity {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}

// MARK: - NameEntity
struct NameEntity {
    let title, first, last: String
}

// MARK: - PictureEntity
struct PictureEntity {
    let large, medium, thumbnail: String
}
