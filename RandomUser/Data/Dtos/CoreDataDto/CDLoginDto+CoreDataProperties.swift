//
//  CDLoginDto+CoreDataProperties.swift
//  RandomUser
//
//  Created by barufe on 27/02/24.
//
//

import Foundation
import CoreData


extension CDLoginDto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDLoginDto> {
        return NSFetchRequest<CDLoginDto>(entityName: "CDLoginDto")
    }

    @NSManaged public var md5: String?
    @NSManaged public var password: String?
    @NSManaged public var salt: String?
    @NSManaged public var sha1: String?
    @NSManaged public var sha256: String?
    @NSManaged public var username: String?
    @NSManaged public var uuid: String?
    @NSManaged public var user: CDUserDto?

}

extension CDLoginDto : Identifiable {

}
