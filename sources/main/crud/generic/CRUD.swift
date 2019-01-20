// Copyright 2017 Guillermo Gonzalez
// https://medium.com/@gonzalezreal/using-realm-with-value-types-b69947741e8b
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.

import Foundation
import os

public struct CRUD<T: Persistable> {
    
    private let container: Container
    private let queue: DispatchQueue
    
    init(container: Container, queue: DispatchQueue) {
        
        self.container = container
        self.queue = queue
    }
    
    public func all() -> [T] {
        
        return read {

            // swiftlint:disable syntactic_sugar
            Array<T>(container.values(T.self))
        }
    }
    
    // Create the given object. This will throw an error if you pass an object with a primary key that already exist in Realm.
    public func create(_ object: T) {
        
        guard object.primaryKey != nil else {
            
            os_log("🚨 Create Rejected: you didn’t pass the primary key of the contact to create.")
            return
        }
        writeOperation { $0.add(object, update: false) }
    }
    
    // Update the object with the given values. One of the properties must be the primary key.
    public func update(_ values: [T.PropertyValue]) {
        
        guard T.containsPrimaryKey(values: values) else {
            os_log("🚨 Update Rejected: you didn’t pass the primary key of the contact to update.")
            return
        }
        writeOperation { $0.update(T.self, values: values) }
    }
    
    // Update ALL the properties of the passed object.
    public func update(object: T) {
        
        guard object.primaryKey != nil else {
            os_log("🚨 Update Rejected: you didn’t pass the primary key of the contact to update.")
            return
        }
        writeOperation { $0.add(object, update: true) }
    }
    
    public func matching(_ query: T.Query) -> [T] {
        
        return read {
            
            container.values(T.self, matching: query).results.map { rlmObject in
                
                T(managedObject: rlmObject)
            }
        }
    }
    
    public func delete(_ objects: [T]) {
        
        writeOperation { $0.delete(objects) }
    }
    
    // MARK: - Private
    private func writeOperation(_ operation: @escaping (WriteTransaction) -> Void) {
        
        write {
            
            do {
                
                try container.write { operation($0) }
            } catch {
                os_log("🚨 %@", "\(error)")
            }
        }
    }
    
    private func write(task: () -> Void) {
        
        queue.sync(flags: .barrier) {
            
            task()
        }
    }
    
    private func read(task: () -> ([T])) -> [T] {
        
        var objects = [T]()
        withoutActuallyEscaping(task) { escapableTask in
            queue.sync {
                
                objects = escapableTask()
            }
        }
        return objects
    }
}
