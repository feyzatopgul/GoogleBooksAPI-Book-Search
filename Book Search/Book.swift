//
//  Book.swift
//  Search Book By Author
//
//  Created by fyz on 10/29/20.
//  Copyright © 2020 Feyza Topgul. All rights reserved.
//

import Foundation

struct Book: Codable {
    var items: [Item]
}

struct Item: Codable {
    var volumeInfo: VolumeInfo
}

struct VolumeInfo: Codable {
    var title: String?
    var subtitle: String?
    var authors: [String]?
    var publisher: String?
    var publishedDate: String?
    var description: String?
    var pageCount: Int?
    var imageLinks: ImageLink?
    var language: String?
}

struct ImageLink: Codable {
    var thumbnail: String?
    var small: String?
    var medium: String?
    var large: String?
    var smallThumbnail: String?
    var extraLarge: String?
}
struct Books: Codable{
    var books: [Book]
}
