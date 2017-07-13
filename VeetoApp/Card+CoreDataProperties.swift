//
//  Card+CoreDataProperties.swift
//  VeetoApp
//
//  Created by IFCE on 13/07/17.
//  Copyright © 2017 IFCE. All rights reserved.
//

import Foundation
import CoreData


extension Card {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Card> {
        return NSFetchRequest<Card>(entityName: "Card")
    }

    @NSManaged public var fifthWord: String?
    @NSManaged public var fourthWord: String?
    @NSManaged public var thirdWord: String?
    @NSManaged public var secondWord: String?
    @NSManaged public var firstWord: String?
    @NSManaged public var mainWord: String?
    @NSManaged public var id: Int64

}
