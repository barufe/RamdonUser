//
//  UserDTO.swift
//  RandomUser
//
//  Created by barufe on 28/02/24.
//

import Foundation
import CoreData

// MARK: - ResponseDto
struct ResponseDto: Codable {
    let results: [UserDto]
    let info: InfoDto
    init(cdObject: NSManagedObject) throws {
        guard let resultObject = cdObject.value(forKey: "results") as? Set<NSManagedObject>,
              let infoObject = cdObject.value(forKey: "info") as? NSManagedObject else {
            throw CDError.parsing
        }
        results = try resultObject.compactMap{ userObject in
            return try UserDto(cdObject: userObject)
        }
        info = InfoDto(cdObject: infoObject)
    }
}

// MARK: - InfoDto
struct InfoDto: Codable {
    let seed: String
    let results, page: Int
    let version: String
    init(cdObject: NSManagedObject) {
        seed = cdObject.value(forKey: "seed") as? String ?? ""
        results = cdObject.value(forKey: "results") as? Int ?? 0
        page = cdObject.value(forKey: "page") as? Int ?? 0
        version = cdObject.value(forKey: "version") as? String ?? ""
    }
}

// MARK: - UserDto
struct UserDto: Codable {
    let gender: String
    let name: NameDto
    let location: LocationDto
    let email: String
    let login: LoginDto
    let dob: DobDto
    let registered: RegisterDto
    let phone, cell: String
    let id: IDDto
    let picture: PictureDto
    let nat: String
    init(cdObject: NSManagedObject) throws {
        gender = cdObject.value(forKey: "gender") as? String ?? ""
        email = cdObject.value(forKey: "email") as? String ?? ""
        phone = cdObject.value(forKey: "phone") as? String ?? ""
        cell = cdObject.value(forKey: "cell") as? String ?? ""
        nat = cdObject.value(forKey: "nat") as? String ?? ""
        guard let nameObject = cdObject.value(forKey: "name") as? NSManagedObject,
              let locationObject = cdObject.value(forKey: "location") as? NSManagedObject,
              let loginObject = cdObject.value(forKey: "login") as? NSManagedObject,
              let dobObject = cdObject.value(forKey: "dob") as? NSManagedObject,
              let registerObject = cdObject.value(forKey: "registered") as? NSManagedObject,
              let idObject = cdObject.value(forKey: "id") as? NSManagedObject,
              let pictureObject = cdObject.value(forKey: "picture") as? NSManagedObject
        else {
            throw CDError.parsing
        }
        name = NameDto(cdObject: nameObject)
        location = try LocationDto(cdObject: locationObject)
        login = LoginDto(cdObject: loginObject)
        dob = DobDto(cdObject: dobObject)
        registered = RegisterDto(cdObject: registerObject)
        id = IDDto(cdObject: idObject)
        picture = PictureDto(cdObject: pictureObject)
    }
}

// MARK: - DobDto
struct DobDto: Codable {
    let date: String
    let age: Int
    init(cdObject: NSManagedObject) {
        date = cdObject.value(forKey: "date") as? String ?? ""
        age = cdObject.value(forKey: "age") as? Int ?? 0
    }
}
struct RegisterDto: Codable {
    let date: String
    let age: Int
    init(cdObject: NSManagedObject) {
        date = cdObject.value(forKey: "date") as? String ?? ""
        age = cdObject.value(forKey: "age") as? Int ?? 0
    }
}

// MARK: - IDDto
struct IDDto: Codable {
    let name: String
    let value: String?
    init(cdObject: NSManagedObject) {
        name = cdObject.value(forKey: "idName") as? String ?? ""
        value = cdObject.value(forKey: "idValue") as? String ?? ""
    }
}

// MARK: - LocationDto
struct LocationDto: Codable {
    let street: StreetDto
    let city, state, country: String
    let coordinates: CoordinatesDto
    let timezone: TimezoneDto
    init(cdObject: NSManagedObject) throws{
        city = cdObject.value(forKey: "city") as? String ?? ""
        state = cdObject.value(forKey: "state") as? String ?? ""
        country = cdObject.value(forKey: "country") as? String ?? ""
        guard let streetObject = cdObject.value(forKey: "street") as? NSManagedObject,
              let coordinatesObject = cdObject.value(forKey: "coordinates") as? NSManagedObject,
              let timezoneObject = cdObject.value(forKey: "timezone") as? NSManagedObject
        else{
            throw CDError.generic
        }
        street = StreetDto(cdObject: streetObject)
        coordinates = CoordinatesDto(cdObject: coordinatesObject)
        timezone = TimezoneDto(cdObject: timezoneObject)
    }
}

// MARK: - CoordinatesDto
struct CoordinatesDto: Codable {
    let latitude, longitude: String
    init(cdObject: NSManagedObject) {
        latitude = cdObject.value(forKey: "latitude") as? String ?? ""
        longitude = cdObject.value(forKey: "longitude") as? String ?? ""
    }
}

// MARK: - StreetDto
struct StreetDto: Codable {
    let number: Int
    let name: String
    init(cdObject: NSManagedObject){
        number = cdObject.value(forKey: "streetNumber") as? Int ?? 0
        name = cdObject.value(forKey: "streetName") as? String ?? ""
    }
}

// MARK: - TimezoneDto
struct TimezoneDto: Codable {
    let offset, description: String
    init(cdObject: NSManagedObject){
        offset = cdObject.value(forKey: "offset") as? String ?? ""
        description = cdObject.value(forKey: "descriptions") as? String ?? ""
    }
}

// MARK: - LoginDto
struct LoginDto: Codable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
    init(cdObject: NSManagedObject) {
        uuid = cdObject.value(forKey: "uuid") as? String ?? ""
        username = cdObject.value(forKey: "username") as? String ?? ""
        password = cdObject.value(forKey: "password") as? String ?? ""
        salt = cdObject.value(forKey: "salt") as? String ?? ""
        md5 = cdObject.value(forKey: "md5") as? String ?? ""
        sha1 = cdObject.value(forKey: "sha1") as? String ?? ""
        sha256 = cdObject.value(forKey: "sha256") as? String ?? ""
    }
}

// MARK: - Name
struct NameDto: Codable {
    let title, first, last: String
    init(cdObject: NSManagedObject) {
        title = cdObject.value(forKey: "title") as? String ?? ""
        first = cdObject.value(forKey: "first") as? String ?? ""
        last = cdObject.value(forKey: "last") as? String ?? ""
    }
}

// MARK: - Picture
struct PictureDto: Codable {
    let large, medium, thumbnail: String
    init(cdObject: NSManagedObject){
        large = cdObject.value(forKey: "largeURL") as? String ?? ""
        medium = cdObject.value(forKey: "mediumURL") as? String ?? ""
        thumbnail = cdObject.value(forKey: "thumbnailURL") as? String ?? ""
    }
}

