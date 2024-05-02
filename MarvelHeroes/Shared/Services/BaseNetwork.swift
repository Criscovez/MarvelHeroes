//
//  BaseNetwork.swift
//  MarvelHeroes
//
//  Created by Cristian Contreras Velásquez on 29-04-24.
//

import Foundation

let host = "gateway.marvel.com"

struct HTTPMethods {
    static let get = "GET"
    static let content = "application/json"
}

enum endpoints: String {
    case heros = "/v1/public/characters"

}


struct BaseNetwork{
    
    var components = URLComponents()
    
//    components.scheme = "https"
//    components.host = "advswift.com"
//    components.path = "/api/devs"
//
//    components.queryItems = [
//        URLQueryItem(name: "skill", value: "4c64c5a2e16fb54ba9b851005b3d85fb"),
//        URLQueryItem(name: "ts", value: "1"),
//        URLQueryItem(name: "hash", value: "09a08b86af7b3f5c25391bbf70249b8e"),
//        URLQueryItem(name: "orderBy", value: "-modified")
//        
//    ]
//
//    // "https://advswift.com/api/devs?skill=swift
//    components.string
    
    
    func getHeros() -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = endpoints.heros.rawValue
        
        components.queryItems = [
            URLQueryItem(name: "apikey", value: "4c64c5a2e16fb54ba9b851005b3d85fb"),
            URLQueryItem(name: "ts", value: "1"),
            URLQueryItem(name: "hash", value: "09a08b86af7b3f5c25391bbf70249b8e"),
            URLQueryItem(name: "orderBy", value: "-modified")
        ]
        //let urlCad : String = "\(server)\(endpoints.heros.rawValue)"
        print(components.string)
        var request = URLRequest(url: URL(string: components.string!)!)
        
        //post
        request.httpMethod = HTTPMethods.get
        //Asignamos al body de la llamada el JSON
        //request.httpBody = try? JSONEncoder().encode(HerosRequest(name: filter))
        
        //Headers
        //request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
//        if let tokenJwT = loadKC(key: CONST_TOKEN_ID){
//            request.addValue("Bearer \(tokenJwT)", forHTTPHeaderField: "Authorization")
//        } else {
//            NSLog("Ojo sin token....")
//        }
        return request
    }

    
    
    
}
