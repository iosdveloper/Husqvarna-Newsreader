//
//  NewsListView.swift
//  Newsreader
//
//  Created by Ashutosh Dadhich on 19/11/24.
//

import SwiftUI

struct NewsListView: View {
    @StateObject private var viewModel = NewsViewModel()
    @State private var isBookmarked = false
    @State private var selectedCategory: String = "General"
    
    var body: some View {
        NavigationView {
            
            
            VStack {
                Picker("Category", selection: $selectedCategory) {
                    Text("General").tag("general")
                    Text("Technology").tag("technology")
                    Text("Sports").tag("sports")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .onChange(of: selectedCategory, { oldValue, newValue in
                    viewModel.fetchNews(category: newValue.lowercased())
                })
               
                List(viewModel.articles,id: \.self) { article in
                    NavigationLink(destination: NewsDetailView(article: article)) {
                        HStack {
                            if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                                AsyncImage(url: url) { image in
                                    image.resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            VStack(alignment: .leading) {
                                Text(article.title ?? "No Title").font(.headline)
                                Text(article.description ?? "No Description").font(.subheadline).lineLimit(2)
                            }
                        }
                    }
                }
                .onAppear {
                    viewModel.fetchNews(category: selectedCategory.lowercased())
                }
            

                NavigationLink(destination: BookmarksView()) {
                    Text("View Bookmarks")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.top)
                }
            }
            .navigationTitle("News")
          
        }
    }
}
