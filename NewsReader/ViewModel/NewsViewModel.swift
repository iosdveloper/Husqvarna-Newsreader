//
//  NewsViewModel.swift
//  Newsreader
//
//  Created by Ashutosh Dadhich on 19/11/24.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchNews(category: String) {
        NetworkManager.shared.fetchNews(for: category)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching news: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] articles in
                self?.articles = articles
            })
            .store(in: &cancellables)
    }
}

