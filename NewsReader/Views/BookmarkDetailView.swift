//
//  BookmarkDetailView.swift
//  Newsreader
//
//  Created by Ashutosh Dadhich on 19/11/24.
//

import SwiftUI

struct BookmarkDetailView: View {
    let bookmark: Bookmark

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(bookmark.title ?? "No Title")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 10)

                if let imageUrl = bookmark.urlToImage, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(height: 200)
                    .cornerRadius(10)
                }

                Text(bookmark.content ?? "No Content")
                    .padding(.vertical)

                Link("Read More", destination: URL(string: bookmark.url ?? "")!)
                    .foregroundColor(.blue)
                    .padding(.top)
            }
            .padding()
        }
        
    }
}
