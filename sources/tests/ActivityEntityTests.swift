
import XCTest
@testable import CRUD

class ActivityEntityTests: XCTestCase {
    
    fileprivate var persistenceApi: PersistenceApi?
    
    override func setUp() {
        
        super.setUp()
        persistenceApi = PersistenceApi() /* default initalizer = in-memory configuration */
    }
    
    override func tearDown() {
        
        super.tearDown()
        persistenceApi = nil
    }
}

extension ActivityEntityTests {
    
    func testCreateActivity() {
        
        let activity: ActivityEntity = TestData.randomActivityEntity()
        persistenceApi?.activityCrud().create(activity)
        
        guard let activities = persistenceApi?.activityCrud().all(),
                let firstActivity = activities.first else {
            XCTFail("Expected get one ActivityEntity at least.")
            return
        }
        
        XCTAssert(activities.count == 1, "Expected get only one Account, got \(activities.count).")
        XCTAssert(firstActivity.id == activity.id, "The object returned should be equal to the one created.")
    }

    func testAllActivities() {

        let activity1 = TestData.randomActivityEntity()
        let activity2 = TestData.randomActivityEntity()
        persistenceApi?.activityCrud().create(activity1)
        persistenceApi?.activityCrud().create(activity2)

        guard let activities = persistenceApi?.activityCrud().all() else {
            XCTFail("Expected get one ActivityEntity at least.")
            return
        }

        XCTAssert(activities.count == 2, "Expected get two ActivityEntity, got \(activities.count).")
    }

    func testQueryByPrimaryKey() {

        let activity: ActivityEntity = TestData.randomActivityEntity()
        persistenceApi?.activityCrud().create(activity)

        let query = ActivityEntity.Query.primaryKey(activity.id.value)
        guard let accountObjects = persistenceApi?.activityCrud().matching(query),
            let accountObject = accountObjects.first else {
                XCTFail("Expected get one Account at least.")
                return
        }

        XCTAssert(accountObjects.count == 1, "Expected get only one Account, got \(accountObjects.count).")
        XCTAssert(accountObject.id == activity.id, "The object returned should be equal to the one created.")
    }

    func testUpdateAccount() {

        // two random activities
        let activity1 = TestData.randomActivityEntity()
        let activity2 = TestData.randomActivityEntity()
        [activity1, activity2].forEach { persistenceApi?.activityCrud().create($0) }

        // update activity1 with the company name of activity2
        let values: [ActivityEntity.PropertyValue] = [
            .id(activity1.id),
            .companyName(activity2.companyName)
        ]
        persistenceApi?.activityCrud().update(values)

        let query = ActivityEntity.Query.primaryKey(activity1.id.value)
        guard let activity1ReadBack = persistenceApi?.activityCrud().matching(query).first else {
            XCTFail("Expected get one Account at least.")
            return
        }

        XCTAssert(activity1ReadBack.companyName == activity2.companyName, "Udpate fail, both object must be equals")
    }

    func testDeleteAccounts() {

        let activity1 = TestData.randomActivityEntity()
        let activity2 = TestData.randomActivityEntity()
        let activity3 = TestData.randomActivityEntity()
        [activity1, activity2, activity3].forEach { persistenceApi?.activityCrud().create($0) }

        persistenceApi?.activityCrud().delete([activity1, activity2])

        guard let accountObjects = persistenceApi?.activityCrud().all(),
                let accountObject = accountObjects.first else {
            XCTFail("Expected get one Account at least.")
            return
        }

        XCTAssert(accountObjects.count == 1, "Expected get only one Account, got \(accountObjects.count).")
        XCTAssert(activity3.id == accountObject.id, "The object returned should be equal to the one created.")
    }
}
