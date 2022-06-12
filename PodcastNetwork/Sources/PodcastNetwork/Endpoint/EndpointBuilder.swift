import Foundation

public final class EndpointBuilder {
    private var url: URL?
    private var method: HTTPMethod?
    private var cachePolicy: URLRequest.CachePolicy?

    public func url(
        scheme: URLScheme,
        host: URLHost,
        path: String,
        queryItems: [URLQueryItem] = []
    ) -> Self {
        self.url = try? URLBuilder()
            .scheme(scheme)
            .host(host)
            .path(path)
            .build()
        return self
    }

    public func method(_ method: HTTPMethod) -> Self {
        self.method = method
        return self
    }

    public func cachePolicy(_ cachePolicy: URLRequest.CachePolicy?) -> Self {
        self.cachePolicy = cachePolicy
        return self
    }

    public func build() throws -> Endpoint {
        guard let url = url else {
            throw EndpointError.missingURL
        }

        guard let method = method else {
            throw EndpointError.missingHTTPMethod
        }

        return Endpoint(
            url: url,
            method: method,
            cachePolicy: cachePolicy
        )
    }
}
