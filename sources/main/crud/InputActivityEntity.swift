//
//  Activity.swift
//  Data
//
//  Created by Alejandro Ramirez on 16/01/2019.
//  Copyright © 2019 Teamwork. All rights reserved.
//

import Foundation

protocol AutogenerateMe {}

public struct InputActivityEntity: AutogenerateMe {
    
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
    
}
