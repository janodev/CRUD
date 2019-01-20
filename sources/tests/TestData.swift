//
//  TestData.swift
//  CRUD
//
//  Created by Alejandro Ramirez on 19/01/2019.
//  Copyright © 2019 Alejandro Ramirez. All rights reserved.
//

import Foundation
@testable import CRUD

enum TestData {
    
    static let randomIdentifier: () -> (Identifier) = { Identifier.int(Int.random(in: 0...100)) }
    static let randomString: () -> (String) = { UUID().uuidString }
    
    static func randomActivityEntity() -> ActivityEntity {
        
        return ActivityEntity(
            activityType: randomString(),
            companyId: randomIdentifier(),
            companyName: randomString(),
            description: randomString(),
            extraDescription: randomString(),
            id: randomIdentifier(),
            itemId: randomIdentifier(),
            itemLink: randomString(),
            itemType: randomString(),
            parentItemLink: randomString(),
            projectId: randomIdentifier(),
            projectName: randomString(),
            userAvatarURL: randomString(),
            userId: randomIdentifier(),
            userName: randomString()
        )
    }
}
