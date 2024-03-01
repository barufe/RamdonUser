//
//  CDPictureDto+CoreDataProperties.swift
//  RandomUser
//
//  Created by barufe on 29/02/24.
//
//

import Foundation
import CoreData


extension CDPictureDto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPictureDto> {
        return NSFetchRequest<CDPictureDto>(entityName: "CDPictureDto")
    }

    @NSManaged public var largeURL: String?
    @NSManaged public var mediumURL: String?
    @NSManaged public var thumbnailURL: String?

}

extension CDPictureDto : Identifiable {

}
