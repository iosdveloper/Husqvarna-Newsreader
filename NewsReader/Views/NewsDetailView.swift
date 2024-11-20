//
//  NewsDetailView.swift
//  Newsreader
//
//  Created by Ashutosh Dadhich on 19/11/24.
//

import SwiftUI

struct NewsDetailView: View {
    let article: Article
    @StateObject private var bookmarkViewModel = BookmarkViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(article.title ?? "No Title")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 10)

                if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(height: 200)
                    .cornerRadius(10)
                }

                Text(article.content ?? "No Content")
                    .padding(.vertical)

                Link("Read More", destination: URL(string: article.url ?? "No URL")!)
                    .foregroundColor(.blue)
                    .padding(.top)

                // Bookmark Button
                Button(action: {
                    bookmarkViewModel.addBookmark(article: article)
                        
                }) {
                    Text("Add to Bookmark")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.top)
                }
            }
            .padding()
        }
    }
}

