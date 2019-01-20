//
//  StoredActivity.swift
//  Data
//
//  Created by Leo Font on 10/10/18.
//  Copyright © 2018 Teamwork. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
public final class ActivityObject: Object {
    
    public dynamic var id: Int = 0
    public dynamic var descriptionText: String = ""
    public dynamic var extraDescription: String?
    public dynamic var activityType: String = ""
    public dynamic var itemType: String = ""
    public dynamic var itemId: Int = 0
    public dynamic var itemLink: String?
    public dynamic var parentItemLink: String?
    public dynamic var companyId: Int = 0
    public dynamic var companyName: String = ""
    public dynamic var projectId: Int = 0
    public dynamic var projectName: String = ""
    public dynamic var userId: Int = 0
    public dynamic var userName: String = ""
    public dynamic var userAvatarURL: String?
    
    public convenience init(id: Int,
                            descriptionText: String,
                            extraDescription: String?,
                            activityType: String,
                            itemType: String,
                            itemId: Int,
                            itemLink: String?,
                            parentItemLink: String?,
                            companyId: Int,
                            companyName: String,
                            projectId: Int,
                            projectName: String,
                            userId: Int,
                            userName: String,
                            userAvatarURL: String?) {
        
        self.init()
        self.id = id
        self.descriptionText = descriptionText
        self.extraDescription = extraDescription
        self.activityType = activityType
        self.itemType = itemType
        self.itemId = itemId
        self.itemLink = itemLink
        self.parentItemLink = parentItemLink
        self.companyId = companyId
        self.companyName = companyName
        self.projectId = projectId
        self.projectName = projectName
        self.userId = userId
        self.userName = userName
        self.userAvatarURL = userAvatarURL
    }
    
    override public static func primaryKey() -> String? {
        
        return "id"
    }
}
