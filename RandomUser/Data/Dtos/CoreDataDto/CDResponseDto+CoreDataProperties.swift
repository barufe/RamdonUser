//
//  CDResponseDto+CoreDataProperties.swift
//  RandomUser
//
//  Created by barufe on 29/02/24.
//
//

import Foundation
import CoreData


extension CDResponseDto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDResponseDto> {
        return NSFetchRequest<CDResponseDto>(entityName: "CDResponseDto")
    }

    @NSManaged public var info: CDInfoDto?
    @NSManaged public var results: NSSet?

}

// MARK: Generated accessors for results
extension CDResponseDto {

    @objc(addResultsObject:)
    @NSManaged public func addToResults(_ value: CDUserDto)

    @objc(removeResultsObject:)
    @NSManaged public func removeFromResults(_ value: CDUserDto)

    @objc(addResults:)
    @NSManaged public func addToResults(_ values: NSSet)

    @objc(removeResults:)
    @NSManaged public func removeFromResults(_ values: NSSet)

}

extension CDResponseDto : Identifiable {

}
