//
//  BookmarksView.swift
//  Newsreader
//
//  Created by Ashutosh Dadhich on 19/11/24.
//

import SwiftUI

struct BookmarksView: View {
    @StateObject private var viewModel = BookmarkViewModel()
    @State private var selectedBookmark: Bookmark?

    var body: some View {
        NavigationView {
            List(viewModel.bookmarks, id: \.self) { bookmark in
                NavigationLink(destination: BookmarkDetailView(bookmark: bookmark)) {
                    Text(bookmark.title ?? "No Title")
                }
            }
            .onAppear {
                viewModel.loadBookmarks()
            }
        }
    }
}

