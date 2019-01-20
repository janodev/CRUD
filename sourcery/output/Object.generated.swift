import Foundation
import RealmSwift
@objcMembers
public final class InputActivityEntityObject: Object
{
    public dynamic var activityType: String = ""
    public dynamic var companyId: Identifier = ""
    public dynamic var companyName: String = ""
    public dynamic var description: String = ""
    public dynamic var extraDescription: String? = ""
    public dynamic var id: Identifier = ""
    public dynamic var itemId: Identifier = ""
    public dynamic var itemLink: String? = ""
    public dynamic var itemType: String = ""
    public dynamic var parentItemLink: String? = ""
    public dynamic var projectId: Identifier = ""
    public dynamic var projectName: String = ""
    public dynamic var userAvatarURL: String? = ""
    public dynamic var userId: Identifier = ""
    public dynamic var userName: String = ""
    public convenience init(
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

    public override static func primaryKey() -> String?
    {
        return "id"
    }
}
