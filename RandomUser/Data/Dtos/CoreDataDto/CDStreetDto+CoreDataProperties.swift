//
//  CDStreetDto+CoreDataProperties.swift
//  RandomUser
//
//  Created by barufe on 29/02/24.
//
//

import Foundation
import CoreData


extension CDStreetDto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDStreetDto> {
        return NSFetchRequest<CDStreetDto>(entityName: "CDStreetDto")
    }

    @NSManaged public var streetName: String?
    @NSManaged public var streetNumber: Int16

}

extension CDStreetDto : Identifiable {

}
