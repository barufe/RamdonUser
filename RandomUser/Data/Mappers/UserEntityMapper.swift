//
//  UserEntityMapper.swift
//  RandomUser
//
//  Created by barufe on 29/02/24.
//

import Foundation

struct UserEntityMapper {
    static func mapDto(dto: ResponseDto) -> ResponseEntity {
        let infoEntity = InfoEntity(seed: dto.info.seed, results: dto.info.results, page: dto.info.page, version: dto.info.version)
        let userEntities = dto.results.map { userDto in
            return mapUserDto(dto: userDto)
        }
        return ResponseEntity(results: userEntities, info: infoEntity)
    }
    
    static func mapUserDto(dto: UserDto) -> UserEntity {
        let nameEntity = NameEntity(title: dto.name.title, first: dto.name.first, last: dto.name.last)
        let streetEntity = StreetEntity(number: dto.location.street.number, name: dto.location.street.name)
        let coordinatesEntity = CoordinatesEntity(latitude: dto.location.coordinates.latitude, longitude: dto.location.coordinates.longitude)
        let timezoneEntity = TimezoneEntity(offset: dto.location.timezone.offset, description: dto.location.timezone.description)
        let locationEntity = LocationEntity(street: streetEntity, city: dto.location.city, state: dto.location.state, country: dto.location.country, postcode: "", coordinates: coordinatesEntity, timezone: timezoneEntity)
        let loginEntity = LoginEntity(uuid: dto.login.uuid, username: dto.login.username, password: dto.login.password, salt: dto.login.salt, md5: dto.login.md5, sha1: dto.login.sha1, sha256: dto.login.sha256)
        let dobEntity = DobEntity(date: dto.dob.date, age: dto.dob.age)
        let registeredEntity = RegisteredEntity(date: dto.registered.date, age: dto.registered.age)
        let idEntity = IDEntity(name: dto.id.name, value: dto.id.value ?? "")
        let pictureEntity = PictureEntity(large: dto.picture.large, medium: dto.picture.medium, thumbnail: dto.picture.thumbnail)
        
        return UserEntity(gender: dto.gender, name: nameEntity, location: locationEntity, email: dto.email, login: loginEntity, dob: dobEntity, registered: registeredEntity, phone: dto.phone, cell: dto.cell, id: idEntity, picture: pictureEntity, nat: dto.nat)
    }
}
