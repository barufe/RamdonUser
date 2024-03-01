//
//  CDUserDto+CoreDataProperties.swift
//  RandomUser
//
//  Created by barufe on 29/02/24.
//
//

import Foundation
import CoreData


extension CDUserDto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUserDto> {
        return NSFetchRequest<CDUserDto>(entityName: "CDUserDto")
    }

    @NSManaged public var cell: String?
    @NSManaged public var email: String?
    @NSManaged public var gender: String?
    @NSManaged public var nat: String?
    @NSManaged public var phone: String?
    @NSManaged public var dob: CDDobDto?
    @NSManaged public var id: CDIdDto?
    @NSManaged public var location: CDLocationDto?
    @NSManaged public var login: CDLoginDto?
    @NSManaged public var name: CDNameDto?
    @NSManaged public var picture: CDPictureDto?
    @NSManaged public var registered: CdRegisteredDto?

}

extension CDUserDto : Identifiable {

}
