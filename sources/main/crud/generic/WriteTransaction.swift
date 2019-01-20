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
import RealmSwift

public final class WriteTransaction {
    
    private let realm: Realm
    
    internal init(realm: Realm) {
        
        self.realm = realm
    }
    
    public func add<T: Persistable>(_ value: T, update: Bool = false) {
        
        realm.add(value.unpersistedManagedObject(), update: update)
    }
    
    public func add<T: Sequence>(_ values: T, update: Bool = false) where T.Iterator.Element: Persistable {
        
        values.forEach { add($0, update: update) }
    }
    
    public func delete<T: Persistable>(_ value: T) {
        
        let object = value.unpersistedManagedObject()
        realm.add(value.unpersistedManagedObject(), update: true)
        realm.delete(object)
    }
    
    public func delete<T: Sequence>(_ values: T) where T.Iterator.Element: Persistable {
        
        let objects = values.map { $0.unpersistedManagedObject() }
        for object in objects {
            
            realm.add(object, update: true)
            realm.delete(object)
        }
    }
    
    public func deleteAll() {
        
        realm.deleteAll()
    }
    
    /**
      @param values Dictionary containing the primary key of the object to update, and any additional properties you want to update.
     */
    public func update<T: Persistable>(_ type: T.Type, values: [T.PropertyValue]) {
        
        var dictionary: [String: Any] = [:]
        values.forEach {
            
            let pair = $0.propertyValuePair
            dictionary[pair.name] = pair.value
        }
        let rlmObject = realm.create(T.ManagedObject.self, value: dictionary, update: true)
        os_log("🚨 \tUpdated rlmContact = %@", rlmObject.debugDescription)
    }
}
