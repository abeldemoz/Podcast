public extension APIService {
    static func itunesEndpoint(searchTerm: String) throws -> Endpoint {
        let encodedSearchTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? ""

        return try EndpointBuilder()
            .method(.get)
            .url(scheme: .https, host: .itunes, path: "/search?term=\(encodedSearchTerm)")
            .build()
    }
}
