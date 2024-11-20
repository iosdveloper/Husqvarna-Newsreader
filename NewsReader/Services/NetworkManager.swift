//
//  Untitled.swift
//  Newsreader
//
//  Created by Ashutosh Dadhich on 19/11/24.
//

import Foundation
import Combine

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func fetchNews(for category: String) -> AnyPublisher<[Article], Error> {
        debugPrint("category == ",category)
        let urlString = "https://newsapi.org/v2/top-headlines?category=\(category)&apiKey=13743526535c4c6abf57aecdc8128ec3"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: NewsResponse.self, decoder: JSONDecoder())
            .map(\.articles)
            .eraseToAnyPublisher()
    }
}

