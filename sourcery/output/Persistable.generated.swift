extension InputActivityEntity: Codable, Equatable
{
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
    enum CodingKeys: String, CodingKey
    {
        case activityType
        case companyId
        case companyName
        case description
        case extraDescription
        case id
        case itemId
        case itemLink
        case itemType
        case parentItemLink
        case projectId
        case projectName
        case userAvatarURL
        case userId
        case userName
    }

    public init(
        activityType: String,
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
        userName: String
    )
    {
        self.activityType = activityType
        self.companyId = companyId
        self.companyName = companyName
        self.description = description
        self.extraDescription = extraDescription
        self.id = id
        self.itemId = itemId
        self.itemLink = itemLink
        self.itemType = itemType
        self.parentItemLink = parentItemLink
        self.projectId = projectId
        self.projectName = projectName
        self.userAvatarURL = userAvatarURL
        self.userId = userId
        self.userName = userName
    }
}

extension InputActivityEntity: Persistable
{
    public var primaryKey: String?
    {
        return "id"
    }

    public init(managedObject: InputActivityEntityObject)
    {
        activityType = managedObject.activityType
        companyId = managedObject.companyId
        companyName = managedObject.companyName
        description = managedObject.description
        extraDescription = managedObject.extraDescription
        id = managedObject.id
        itemId = managedObject.itemId
        itemLink = managedObject.itemLink
        itemType = managedObject.itemType
        parentItemLink = managedObject.parentItemLink
        projectId = managedObject.projectId
        projectName = managedObject.projectName
        userAvatarURL = managedObject.userAvatarURL
        userId = managedObject.userId
        userName = managedObject.userName
    }

    public func unpersistedManagedObject() -> InputActivityEntityObject
    {
        let managedObject = InputActivityEntity()
        managedObject.activityType = activityType
        managedObject.companyId = companyId
        managedObject.companyName = companyName
        managedObject.description = description
        managedObject.extraDescription = extraDescription
        managedObject.id = id
        managedObject.itemId = itemId
        managedObject.itemLink = itemLink
        managedObject.itemType = itemType
        managedObject.parentItemLink = parentItemLink
        managedObject.projectId = projectId
        managedObject.projectName = projectName
        managedObject.userAvatarURL = userAvatarURL
        managedObject.userId = userId
        managedObject.userName = userName
        return managedObject
    }

    public enum PropertyValue: PropertyValueType
    {
        case activityType(String)
        case companyId(Identifier)
        case companyName(String)
        case description(String)
        case extraDescription(String?)
        case id(Identifier)
        case itemId(Identifier)
        case itemLink(String?)
        case itemType(String)
        case parentItemLink(String?)
        case projectId(Identifier)
        case projectName(String)
        case userAvatarURL(String?)
        case userId(Identifier)
        case userName(String)
        public var propertyValuePair: PropertyValuePair
        {
            switch self {
            case let .activityType(activityType): return ("activityType", activityType as Any)
            case let .companyId(companyId): return ("companyId", companyId as Any)
            case let .companyName(companyName): return ("companyName", companyName as Any)
            case let .description(description): return ("description", description as Any)
            case let .extraDescription(extraDescription): return ("extraDescription", extraDescription as Any)
            case let .id(id): return ("id", id as Any)
            case let .itemId(itemId): return ("itemId", itemId as Any)
            case let .itemLink(itemLink): return ("itemLink", itemLink as Any)
            case let .itemType(itemType): return ("itemType", itemType as Any)
            case let .parentItemLink(parentItemLink): return ("parentItemLink", parentItemLink as Any)
            case let .projectId(projectId): return ("projectId", projectId as Any)
            case let .projectName(projectName): return ("projectName", projectName as Any)
            case let .userAvatarURL(userAvatarURL): return ("userAvatarURL", userAvatarURL as Any)
            case let .userId(userId): return ("userId", userId as Any)
            case let .userName(userName): return ("userName", userName as Any)
            }
        }
    }

    public enum Query: QueryType
    {
        case primaryKey(Int)
        public var predicate: NSPredicate?
        {
            switch self {
            case let .primaryKey(primaryKey):
                return NSPredicate(format: "id == %d", primaryKey)
                /* other queries */
            }
        }

        public var sortDescriptors: [SortDescriptor]
        {
            return []
        }
    }

    public static func containsPrimaryKey(values: [PropertyValue]) -> Bool
    {
        return values.contains
        { prop -> Bool in
            if case .id = prop
            {
                return true
            }
            return false
        }
    }
}
