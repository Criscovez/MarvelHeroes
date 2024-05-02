//
//  SeriesModel.swift
//  MarvelHeroes
//
//  Created by Cristian Contreras Velásquez on 02-05-24.
//

import Foundation


struct SeriesResponse: Decodable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: SeriesData
}

struct SeriesData: Decodable {
    let offset, limit, total, count: Int
    let results: [SerieResult]
}

struct SerieResult: Identifiable, Decodable  {
    let id: Int
    let title: String
    //let description: null
    let resourceURI: String
    let urls: [URLElement]
    let startYear, endYear: Int
    let rating, type, modified: String
    let thumbnail: Thumbnail
    let creators: Creators
    let characters: Characters
    let stories: Stories
    let comics, events: Characters
    //let next, previous: nil
  
}

struct Characters: Codable {
    let available: Int
    let collectionURI: String
    let items: [CharactersItem]
    let returned: Int
}

struct CharactersItem: Codable {
    let resourceURI: String
    let name: String
}

struct Creators: Codable {
    let available: Int
    let collectionURI: String
    let items: [CreatorsItem]
    let returned: Int
}

struct CreatorsItem: Codable {
    let resourceURI: String
    let name, role: String
}

enum TypeEnum: String, Codable {
    case cover = "cover"
    case interiorStory = "interiorStory"
}


