//
//  Persistence.swift
//  Data
//
//  Created by Alejandro Ramirez on 16/01/2019.
//  Copyright © 2019 Teamwork. All rights reserved.
//

import Foundation
import os
import RealmSwift

public class PersistenceApi {
    
    private let configuration: RealmSwift.Realm.Configuration
    
    // each invocation returns a container for the thread where it is being invoked
    fileprivate var container: Container {
        
        return Container(realm: try! Realm(configuration: configuration))
    }
    
    // queue where all persistence operations are executed
    public private(set) var queue: DispatchQueue
    
    public convenience init?() {
        
        os_log("You are initializing the persistence API with an in-memory configuration.")
        self.init(queue: PersistenceApi.createDefaultQueue(), configuration: PersistenceApi.createInMemoryConfiguration())
    }
    
    public convenience init?(configuration: RealmSwift.Realm.Configuration) {
        
        self.init(queue: PersistenceApi.createDefaultQueue(), configuration: configuration)
    }
    
    public convenience init?(queue: DispatchQueue) {
        
        self.init(queue: queue, configuration: PersistenceApi.createInMemoryConfiguration())
    }
    
    public required init?(queue: DispatchQueue, configuration: RealmSwift.Realm.Configuration) {
        
        self.queue = queue
        self.configuration = configuration
    }
    
    private static func createDefaultQueue() -> DispatchQueue {
        
        return DispatchQueue(label: "Persistence.queue")
    }
    
    private static func createInMemoryConfiguration() -> Realm.Configuration {
        
        let identifier = UUID().uuidString
        return Realm.Configuration(inMemoryIdentifier: identifier)
    }
}

public extension PersistenceApi {
    
    func activityCrud() -> CRUD<ActivityEntity> {
        
        return CRUD<ActivityEntity>(container: container, queue: queue)
    }
}
