//
//  Activity.swift
//  Data
//
//  Created by Alejandro Ramirez on 16/01/2019.
//  Copyright © 2019 Teamwork. All rights reserved.
//

import Foundation

public struct ActivityEntity: Codable, Equatable, AutogenerateMe {
    
    public let activityType: String
    public let companyId: Identifier
    public let companyName: String
    public let description: String
    public let extraDescription: String?
    public let id: Identifier
    public let itemId: Identifier
    public let itemLink: String?
    public let itemType: String
    public let parentItemLink: String?
    public let projectId: Identifier
    public let projectName: String
    public let userAvatarURL: String?
    public let userId: Identifier
    public let userName: String
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case description
        case extraDescription
        case activityType
        case itemType = "type"
        case itemId
        case itemLink = "link"
        case parentItemLink = "itemLink"
        case companyId
        case companyName
        case projectId
        case projectName
        case userId
        case userName
        case userAvatarURL
    }
    
    public init(activityType: String,
                companyId: Identifier,
                companyName: String,
                description: String,
                extraDescription: String?,
                id: Identifier,
                itemId: Identifier,
                itemLink: String?,
                itemType: String,
                parentItemLink: String?,
                projectId: Identifier,
                projectName: String,
                userAvatarURL: String?,
                userId: Identifier,
                userName: String) {
        
        self.id = id
        self.description = description
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
}
