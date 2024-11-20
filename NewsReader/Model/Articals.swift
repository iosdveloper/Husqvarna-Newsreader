//
//  Articals.swift
//  Newsreader
//
//  Created by Ashutosh Dadhich on 19/11/24.
//

import Foundation

struct Article: Codable,Hashable {
    let title: String?
    let description: String?
    let content: String?
    let url: String?
    let urlToImage: String?
}

struct NewsResponse: Codable {
    let articles: [Article]
}
