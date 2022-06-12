import Foundation

// MARK: - Query
public struct ITunesSearchResult: Codable {
    public let resultCount: Int
    public let results: [PodcastJSON]
}

// MARK: - Result
public struct PodcastJSON: Codable {
    public var artistName: String?
    public var trackName: String?
    public var kind: String?
}
