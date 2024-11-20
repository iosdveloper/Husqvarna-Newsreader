//
//  BookmarkViewModel.swift
//  Newsreader
//
//  Created by Ashutosh Dadhich on 19/11/24.
//

import Foundation

class BookmarkViewModel: ObservableObject {
    @Published var bookmarks: [Bookmark] = []

    func loadBookmarks() {
        bookmarks = CoreDataManager.shared.fetchBookmarks()
    }

    func addBookmark(article: Article) {
        CoreDataManager.shared.createBookmark(title: article.title ?? "", description: article.description ?? "", content: article.content ?? "", url: article.url ?? "", urlToImage: article.urlToImage ?? "")
        loadBookmarks()
    }

    func removeBookmark(bookmark: Bookmark) {
        CoreDataManager.shared.deleteBookmark(bookmark: bookmark)
        loadBookmarks()
    }
}
