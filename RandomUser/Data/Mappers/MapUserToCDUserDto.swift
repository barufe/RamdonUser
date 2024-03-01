//
//  MapUserToCDUserDto.swift
//  RandomUser
//
//  Created by barufe on 28/02/24.
//

import Foundation
import CoreData

class MapResponseDtoToCDResponseDto {
    static func mapper(_ response: ResponseDto, context: NSManagedObjectContext) -> CDResponseDto {
        
        let cdResponse = CDResponseDto(context: context)
        let cdInfo = CDInfoDto(context: context)
        
        for user in response.results {
            let cdUser = CDUserDto(context: context)
            
            let cdName = CDNameDto(context: context)
            cdName.first = user.name.first
            cdName.last = user.name.last
            cdName.title = user.name.title
            
            let cdStreet = CDStreetDto(context: context)
            cdStreet.streetName = user.location.street.name
            cdStreet.streetNumber = Int16(user.location.street.number)
            
            let cdCoordinates = CDCoordinatesDto(context: context)
            cdCoordinates.latitude = user.location.coordinates.latitude
            cdCoordinates.longitude = user.location.coordinates.longitude
            
            let cdTimeZone = CDTimeDto(context: context)
            cdTimeZone.offset = user.location.timezone.offset
            cdTimeZone.descriptions = user.location.timezone.description
            
            let cdLocation = CDLocationDto(context: context)
            cdLocation.city = user.location.city
            cdLocation.state = user.location.state
            cdLocation.country = user.location.country
            cdLocation.street = cdStreet
            cdLocation.timezone = cdTimeZone
            cdLocation.coordinates = cdCoordinates
            
            
            let cdLogin = CDLoginDto(context: context)
            cdLogin.uuid = user.login.uuid
            cdLogin.username = user.login.username
            cdLogin.password = user.login.password
            cdLogin.salt = user.login.salt
            cdLogin.md5 = user.login.md5
            cdLogin.sha1 = user.login.sha1
            cdLogin.sha256 = user.login.sha256
            
            let cdDob = CDDobDto(context: context)
            cdDob.date = user.dob.date
            cdDob.age = Int16(user.dob.age)
            
            let cdId = CDIdDto(context: context)
            cdId.idName = user.id.name
            cdId.idValue = user.id.value
            
            let cdPicture = CDPictureDto(context: context)
            cdPicture.largeURL = user.picture.large
            cdPicture.mediumURL = user.picture.medium
            cdPicture.thumbnailURL = user.picture.thumbnail
            
            let cdRegistered = CdRegisteredDto(context: context)
            cdRegistered.age = Int16(user.registered.age)
            cdRegistered.date = user.registered.date
            
            cdUser.gender = user.gender
            cdUser.email = user.email
            cdUser.phone = user.phone
            cdUser.cell = user.cell
            cdUser.nat = user.nat
            cdUser.name = cdName
            cdUser.login = cdLogin
            cdUser.dob = cdDob
            cdUser.id = cdId
            cdUser.picture = cdPicture
            cdUser.location = cdLocation
            cdUser.registered = cdRegistered
            
            cdResponse.addToResults(cdUser)
        }
        
        cdInfo.seed = response.info.seed
        cdInfo.results = Int16(response.info.results)
        cdInfo.page = Int16(response.info.page)
        cdInfo.version = response.info.version
        cdResponse.info = cdInfo
    
        return cdResponse
    }
}
