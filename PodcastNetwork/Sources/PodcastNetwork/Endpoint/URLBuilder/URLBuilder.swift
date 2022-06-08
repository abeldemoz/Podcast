import Foundation
internal final class URLBuilder {
    private var scheme: String?
    private var host: String?
    private var path: String?

    internal init() {}

    internal func scheme(_ scheme: URLScheme) -> Self {
        self.scheme = scheme.rawValue
        return self
    }

    internal func host(_ host: URLHost) -> Self {
        self.host = host.rawValue
        return self
    }

    internal func path(_ path: String) -> Self {
        self.path = path
        return self
    }

    internal func build() throws -> URL? {
        guard let scheme = scheme else {
            throw URLError.missingScheme
        }

        guard let host = host else {
            throw URLError.missingHost
        }

        guard let path = path else {
            throw URLError.missingPath
        }

        return URL(string: scheme + host + path)
    }
}
