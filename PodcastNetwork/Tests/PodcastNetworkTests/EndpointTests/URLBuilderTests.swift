import XCTest
@testable import PodcastNetwork

final class URLBuilderTests: XCTestCase {

    private var testUrl: URL!

    override func tearDown() {
        testUrl = nil
        super.tearDown()
    }

    func testUrlBuilder_buildsCorrectUrl() throws {
        testUrl = try URLBuilder()
            .scheme(.https)
            .host(.itunes)
            .path("/some-path")
            .build()

        let expectedUrl = "https://itunes.apple.com/some-path"

        XCTAssertEqual(testUrl.absoluteString, expectedUrl)
    }
}

