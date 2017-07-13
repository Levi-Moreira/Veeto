//
//  Card+CoreDataClass.swift
//  VeetoApp
//
//  Created by IFCE on 13/07/17.
//  Copyright © 2017 IFCE. All rights reserved.
//

import Foundation
import CoreData
import UIKit


@objc(Card)
public class Card: NSManagedObject {
    
private static let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    
    class func create() -> Card {
        let entity = NSEntityDescription.entity(forEntityName: "Card", in: persistentContainer.viewContext)
        
        return Card(entity: entity!, insertInto: persistentContainer.viewContext)
        
    }
}
