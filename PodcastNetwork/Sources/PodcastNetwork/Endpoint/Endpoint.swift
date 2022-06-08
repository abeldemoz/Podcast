import Foundation

public final class Endpoint {
    public let url: URL
    public let method: HTTPMethod
    public let cachePolicy: URLRequest.CachePolicy?

    public init (
        url: URL,
        method: HTTPMethod,
        cachePolicy: URLRequest.CachePolicy?
    ) {
        self.url = url
        self.method = method
        self.cachePolicy = cachePolicy
    }
}
