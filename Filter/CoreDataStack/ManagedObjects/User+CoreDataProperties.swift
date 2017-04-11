//
//  User+CoreDataProperties.swift
//  Filter
//
//  Created by admin5 on 07.04.17.
//  Copyright © 2017 NoNameOrganization. All rights reserved.
//

import Foundation
import CoreData

extension User {
    @nonobjc public class func myProfileFetchRequest() -> NSFetchRequest<User> {
        let fetchRequest = defaultFetchRequest()
        fetchRequest.predicate = NSPredicate(format: "isMe == true")
        return fetchRequest
    }
    
    @nonobjc public class func closestUsersFetchRequest() -> NSFetchRequest<User> {
        let fetchRequest = defaultFetchRequest()
        fetchRequest.predicate = NSPredicate(format: "isMe == false")
        return fetchRequest
    }
    
    @nonobjc public class func userFetchRequest(id: Int) -> NSFetchRequest<User> {
        let fetchRequest = defaultFetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == \(id)")
        return fetchRequest
    }

    @NSManaged public var aboutMe: String?
    @NSManaged public var age: Int16
    @NSManaged public var city: String?
    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var id: Int64
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var nick: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var photoURLPath: String?
    @NSManaged public var secondName: String?
    @NSManaged public var sex: Bool
    @NSManaged public var status: String?
    @NSManaged public var work: String?
    @NSManaged public var isMe: Bool
    
    //MARK : Private methods
    
    private class func defaultFetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
}
