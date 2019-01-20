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

public final class Container {
    
    private let realm: Realm
    
    public convenience init() throws {
        
        try self.init(realm: Realm())
    }
    
    public init(realm: Realm) {
        
        self.realm = realm
    }
    
    public func write(_ block: (WriteTransaction) throws -> Void) throws {
        
        if realm.isInWriteTransaction {
            
            os_log("🚨 Realm is already in a write transaction.")
        }
        let transaction = WriteTransaction(realm: realm)
        try realm.write {
            
            try block(transaction)
        }
    }
    
    public func values<T> (_ type: T.Type, matching query: T.Query? = nil) -> FetchedResults<T> {
        
        var results = realm.objects(T.ManagedObject.self)
        if let query = query {
            
            if let predicate = query.predicate {
                
                results = results.filter(predicate)
            }
            if query.sortDescriptors.isEmpty {
                
                results = results.sorted(by: query.sortDescriptors)
            }
        }
        return FetchedResults(results: results)
    }
}
