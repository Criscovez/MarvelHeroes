//
//  MarvelHeroesApp.swift
//  MarvelHeroes
//
//  Created by Cristian Contreras Velásquez on 29-04-24.
//

import SwiftUI

@main
struct MarvelHeroesApp: App {
    @StateObject var rootViewModel = RootViewModel() //vm global
    
    var body: some Scene {
        WindowGroup {
            RootView() //enrutador de vistas Raiz
                .environmentObject(rootViewModel)
        }
    }
}
