import XCTest
import PodcastNetwork

class APIServiceTests: XCTestCase {

    private var endpoint: Endpoint!

    override func tearDown() {
        endpoint = nil
        super.tearDown()
    }

    func testAPIService_itunesEndpoint_createsCorrectEndpoint() throws {
        endpoint = try? APIService.itunesEndpoint(searchTerm: "some term")

        XCTAssertEqual(endpoint.method.rawValue, "GET")
        XCTAssertEqual(endpoint.url.absoluteString, "https://itunes.apple.com/search?term=some%20term")

    }

}
