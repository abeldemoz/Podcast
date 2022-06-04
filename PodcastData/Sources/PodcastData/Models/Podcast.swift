import Foundation

public struct Podcast {
    private let _name: String
    private let _artistName: String

    public var name: String {
        _name
    }

    public var artistName: String {
        _artistName
    }

    public init(name: String, artistName: String) {
        self._name = name
        self._artistName = artistName
    }
}
