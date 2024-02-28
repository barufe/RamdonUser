//
//  UserDTO.swift
//  RandomUser
//
//  Created by barufe on 28/02/24.
//

import Foundation

// MARK: - ResponseDto
struct ResponseDto: Codable {
    let results: [UserDto]
    let info: InfoDto
}

// MARK: - InfoDto
struct InfoDto: Codable {
    let seed: String
    let results, page: Int
    let version: String
}

// MARK: - UserDto
struct UserDto: Codable {
    let gender: String
    let name: NameDto
    let location: LocationDto
    let email: String
    let login: LoginDto
    let dob, registered: DobDto
    let phone, cell: String
    let id: IDDto
    let picture: PictureDto
    let nat: String
}

// MARK: - DobDto
struct DobDto: Codable {
    let date: String
    let age: Int
}

// MARK: - IDDto
struct IDDto: Codable {
    let name: String
    let value: String?
    
    init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
           name = try container.decode(String.self, forKey: .name)
           
           if let decodedValue = try? container.decodeIfPresent(String.self, forKey: .value) {
               value = decodedValue
           } else {
               value = nil
           }
       }
}

// MARK: - LocationDto
struct LocationDto: Codable {
    let street: StreetDto
    let city, state, country: String
    let coordinates: CoordinatesDto
    let timezone: TimezoneDto
}

// MARK: - CoordinatesDto
struct CoordinatesDto: Codable {
    let latitude, longitude: String
}

// MARK: - StreetDto
struct StreetDto: Codable {
    let number: Int
    let name: String
}

// MARK: - TimezoneDto
struct TimezoneDto: Codable {
    let offset, description: String
}

// MARK: - LoginDto
struct LoginDto: Codable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}

// MARK: - Name
struct NameDto: Codable {
    let title, first, last: String
}

// MARK: - Picture
struct PictureDto: Codable {
    let large, medium, thumbnail: String
}
