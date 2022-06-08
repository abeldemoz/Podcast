import Foundation

extension APIService {

    public func fetchPodcasts(from endpoint: Endpoint?, completion: @escaping ([PodcastJSON]?) -> Void
    ) {
        guard let endpoint = endpoint else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: endpoint.url) { data, response, error in
            guard error == nil else {
                print(error!.localizedDescription)
                completion(nil)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            let decodedData = try? JSONDecoder().decode(ITunesSearchResult.self, from: data)
            let searchResults = (decodedData?.results ?? []).filter { result in
                result.kind == "podcast"
            }

            completion(searchResults)
        }.resume()
    }
}
