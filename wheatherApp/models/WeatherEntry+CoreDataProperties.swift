//
//  WeatherEntry+CoreDataProperties.swift
//  wheatherApp
//
//  Created by admin on 6/28/22.
//
//

import Foundation
import CoreData


extension WeatherEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherEntry> {
        return NSFetchRequest<WeatherEntry>(entityName: "WeatherEntry")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var positionList: Int16
    @NSManaged public var date: Date?

}

extension WeatherEntry : Identifiable {

}
