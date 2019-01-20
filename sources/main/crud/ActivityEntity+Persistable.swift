//
//  Activity+Persistable.swift
//  Data
//
//  Created by Alejandro Ramirez on 16/01/2019.
//  Copyright © 2019 Teamwork. All rights reserved.
//

import Foundation
import RealmSwift

extension ActivityEntity: Persistable {
    
    public var primaryKey: String? {
        return "id"
    }
    
    public init(managedObject: ActivityObject) {
        
        id = Identifier.int(managedObject.id)
        description = managedObject.descriptionText
        extraDescription = managedObject.extraDescription
        activityType = managedObject.activityType
        itemType = managedObject.itemType
        itemId = Identifier.int(managedObject.itemId)
        itemLink = managedObject.itemLink
        parentItemLink = managedObject.parentItemLink
        companyId = Identifier.int(managedObject.companyId)
        companyName = managedObject.companyName
        projectId = Identifier.int(managedObject.projectId)
        projectName = managedObject.projectName
        userId = Identifier.int(managedObject.userId)
        userName = managedObject.userName
        userAvatarURL = managedObject.userAvatarURL
    }
    
    public func unpersistedManagedObject() -> ActivityObject {
        
        let managedObject = ActivityObject()
        managedObject.id = id.value
        managedObject.descriptionText = description
        managedObject.extraDescription = extraDescription
        managedObject.activityType = activityType
        managedObject.itemType = itemType
        managedObject.itemId = itemId.value
        managedObject.itemLink = itemLink
        managedObject.parentItemLink = parentItemLink
        managedObject.companyId = companyId.value
        managedObject.companyName = companyName
        managedObject.projectId = projectId.value
        managedObject.projectName = projectName
        managedObject.userId = userId.value
        managedObject.userName = userName
        managedObject.userAvatarURL = userAvatarURL
        return managedObject
    }
    
    public enum PropertyValue: PropertyValueType {
        
        case id (Identifier)
        case description (String)
        case extraDescription (String?)
        case activityType (String)
        case itemType (String)
        case itemId (Identifier)
        case itemLink (String?)
        case parentItemLink (String?)
        case companyId (Identifier)
        case companyName (String)
        case projectId (Identifier)
        case projectName (String)
        case userId (Identifier)
        case userName (String)
        case userAvatarURL (String?)
        
        // swiftlint:disable comma
        public var propertyValuePair: PropertyValuePair {
            
            switch self {

            case .id               (let id):               return ("id",               id.value as Any)
            case .description      (let description):      return ("description",      description as Any)
            case .extraDescription (let extraDescription): return ("extraDescription", extraDescription as Any)
            case .activityType     (let activityType):     return ("activityType",     activityType as Any)
            case .itemType         (let itemType):         return ("itemType",         itemType as Any)
            case .itemId           (let itemId):           return ("itemId",           itemId as Any)
            case .itemLink         (let itemLink):         return ("itemLink",         itemLink as Any)
            case .parentItemLink   (let parentItemLink):   return ("parentItemLink",   parentItemLink as Any)
            case .companyId        (let companyId):        return ("companyId",        companyId as Any)
            case .companyName      (let companyName):      return ("companyName",      companyName as Any)
            case .projectId        (let projectId):        return ("projectId",        projectId as Any)
            case .projectName      (let projectName):      return ("projectName",      projectName as Any)
            case .userId           (let userId):           return ("userId",           userId as Any)
            case .userName         (let userName):         return ("userName",         userName as Any)
            case .userAvatarURL    (let userAvatarURL):    return ("userAvatarURL",    userAvatarURL as Any)
            }
        }
    }
    
    public enum Query: QueryType {
        
        case primaryKey(Int)
        
        public var predicate: NSPredicate? {
            switch self {
            case .primaryKey(let primaryKey):
                return NSPredicate(format: "id == %d", primaryKey)
            /* other queries */
            }
        }
        
        public var sortDescriptors: [SortDescriptor] {
            return []
        }
    }
    
    public static func containsPrimaryKey(values: [PropertyValue]) -> Bool {
        
        return values.contains { prop -> Bool in
            if case .id(_) = prop {
                return true
            }
            return false
        }
    }
}
