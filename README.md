A Realm CRUD that provides persistency for arbitrary structs. It uses the code from [this article](https://medium.com/@gonzalezreal/using-realm-with-value-types-b69947741e8b).

![UML](uml.png)

To persist an object:

1. Write a struct with the fields to persist. 
2. Run code generation to expand the original object and create its twin Realm object.

As an example, this project provides 

- a sample input file: [InputActivityEntity.swift](https://github.com/j4n0/CRUD/blob/master/sources/main/crud/InputActivityEntity.swift)
- and two stencil templates: [Object.stencil](https://github.com/j4n0/CRUD/blob/master/sourcery/output/Object.generated.swift), [Persistable.stencil](https://github.com/j4n0/CRUD/blob/master/sourcery/templates/Persistable.stencil).

To see them in action type
- `make sourcery` to generate code
- `make format` to format the generated code 
