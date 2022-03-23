import XCTest
@testable import GroupByTracker

final class GroupByTrackerTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GbTracker(clientId: "test").text, "Hello, World!")
    }
}
