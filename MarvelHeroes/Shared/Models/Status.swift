//
//  Status.swift
//  MarvelHeroes
//
//  Created by Cristian Contreras Velásquez on 29-04-24.
//

import Foundation

enum Status {
    case none, loading, loaded, register, error(error: String)
}
