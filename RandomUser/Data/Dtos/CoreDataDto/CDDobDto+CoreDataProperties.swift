//
//  CDDobDto+CoreDataProperties.swift
//  RandomUser
//
//  Created by barufe on 29/02/24.
//
//

import Foundation
import CoreData


extension CDDobDto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDDobDto> {
        return NSFetchRequest<CDDobDto>(entityName: "CDDobDto")
    }

    @NSManaged public var age: Int16
    @NSManaged public var date: String?

}

extension CDDobDto : Identifiable {

}
