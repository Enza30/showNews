//
//  ArticlesModel.swift
//  showNews
//
//  Created by Farendza Muda on 10/09/22.
//

import Foundation

struct ArticlesModel: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
}


struct Source: Codable {
    let name: String?
}
