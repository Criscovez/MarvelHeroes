//
//  HerosModel.swift
//  MarvelHeroes
//
//  Created by Cristian Contreras Velásquez on 29-04-24.
//

import Foundation

struct HeroesResponse: Decodable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: HeroesData
}

struct HeroesData: Decodable {
    let offset, limit, total, count: Int
    let results: [HeroeResult]
}

struct HeroeResult: Identifiable, Decodable {
    let id: Int
    let name, resultDescription: String
    let modified: String
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics, series: Comics
    let stories: Stories
    let events: Comics
    let urls: [URLElement]
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case modified, thumbnail, resourceURI, comics, series, stories, events, urls
    }
}

struct Comics: Decodable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

struct ComicsItem: Identifiable, Decodable {
    let id = UUID()
    let resourceURI: String
    let name: String
}

struct Stories: Decodable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
    let returned: Int
}

struct StoriesItem: Identifiable, Decodable {
    let id = UUID()
    let resourceURI: String
    let name: String
    let type: String
}

struct Thumbnail: Decodable {
    let path: String
    let thumbnailExtension: String
    
    func Image() -> String {
        return path + "." + thumbnailExtension
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

struct URLElement: Identifiable, Decodable {
    let id = UUID()
    let type: String
    let url: String
}



