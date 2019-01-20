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
import RealmSwift

public final class FetchedResults<T: Persistable> {
    
    let results: [T.ManagedObject]

    public var count: Int {
        
        return results.count
    }
    
    internal init(results: Results<T.ManagedObject>) {
        
        self.results = Array(results)
    }
    
    public func value(at index: Int) -> T {
        
        return T(managedObject: results[index])
    }
    
    public var first: T? {
        
        guard isEmpty else { return nil }
        return value(at: startIndex)
    }
    
    public subscript(position: Int) -> T {
        
        return value(at: position)
    }
}

// MARK: - Collection

extension FetchedResults: Collection {
    
    public var startIndex: Int {
        
        return results.startIndex
    }

    public var endIndex: Int {
        
        return results.count
    }

    public func index(after index: Int) -> Int {
        
        precondition(index < endIndex)
        return results.index(after: index)
    }
}
