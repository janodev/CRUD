
A Realm CRUD with sourcery.

The CRUD uses code from [this article](https://medium.com/@gonzalezreal/using-realm-with-value-types-b69947741e8b).

![UML](uml.png)

Type 
- `make sourcery` to run code generation using [sourcery](https://github.com/krzysztofzablocki/Sourcery). This will transform [InputActivityEntity.swift](https://github.com/j4n0/CRUD/blob/master/sources/main/crud/InputActivityEntity.swift) into the [files](https://github.com/j4n0/CRUD/tree/master/sourcery/output) needed to persist it.
- `make format` to format the generated code using [swiftformat](https://github.com/nicklockwood/SwiftFormat)
