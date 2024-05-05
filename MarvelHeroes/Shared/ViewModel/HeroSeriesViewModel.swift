//
//  HeroSeriesViewModel.swift
//  MarvelHeroes
//
//  Created by Cristian Contreras Velásquez on 03-05-24.
//

import Foundation

final class HeroSeriesViewModel: ObservableObject {
    @Published var series: [SerieResult] = []

    var mocked: Bool = false //para saber si estoy en modo Mockeado
    
    init(mocked : Bool = false){
        self.mocked = mocked
    }
    
    func getSeries(HeroID: String) async {
        
        //mockeado
        if self.mocked{
            getSeriesMock()
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: BaseNetwork().getSessionSeries(HeroID: HeroID))
            
            if let resp = response as? HTTPURLResponse {
                if resp.statusCode == HTTPRresponseCodes.SUCESS {
                    let modelReturn = try JSONDecoder().decode(SeriesResponse.self, from: data)
                    Task{@MainActor in
                        series = (modelReturn.data.results)
                    }
                }
            }
        } catch {
            print("---> error: \(error)")
        }
    }
    
    func getSeriesMock(){
        //mockear los modelos.
        
        let series1 = SerieResult(id: 1, title: "Captain America (2018 - 2022)", description: "the Captain", resourceURI: "String", urls: [URLElement(type: "", url: "")], startYear: 1, endYear: 1, rating: "", type: "", modified: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/9/a0/5b34097c5ea9d", thumbnailExtension: "jpg"), creators: Creators(available: 1, collectionURI: "", items: [CreatorsItem(resourceURI: "", name: "", role: "")], returned: 1), characters: Characters(available: 1, collectionURI: "", items: [CharactersItem(resourceURI: "", name: "")], returned: 1), stories: Stories(available: 1, collectionURI: "", items: [StoriesItem(resourceURI: "", name: "", type: "")], returned: 1), comics: Characters(available: 1, collectionURI: "", items: [CharactersItem(resourceURI: "", name: "")], returned: 1), events: Characters(available: 1, collectionURI: "", items: [CharactersItem(resourceURI: "", name: "")], returned: 1))
        
        let series2 = SerieResult(id: 2, title: "Betsy Braddock: Captain Britain (2023)", description: "THE CAPTAIN COMES HOME! And she's got a whole new mission! With Otherworld settled, Braddock Manor restored, and her brother Captain Avalon at her side, you'd think things look pretty good for Betsy Braddock. Only it turns out, good ole Britain doesn't want her back. No one wants a mutant menace carrying the shield of Captain Britain, and Betsy's made more than a few enemies along her way. Quest-less and country-less, Betsy must define a role for herself. A fresh take on a beloved character, don't miss the latest Tini Howard extravaganza and fan-favorite artist Vasco Georgiev's Marvel debut!", resourceURI: "String", urls: [URLElement(type: "", url: "")], startYear: 1, endYear: 1, rating: "", type: "", modified: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/30/63ee552a1fee1", thumbnailExtension: "jpg"), creators: Creators(available: 1, collectionURI: "", items: [CreatorsItem(resourceURI: "", name: "", role: "")], returned: 1), characters: Characters(available: 1, collectionURI: "", items: [CharactersItem(resourceURI: "", name: "")], returned: 1), stories: Stories(available: 1, collectionURI: "", items: [StoriesItem(resourceURI: "", name: "", type: "")], returned: 1), comics: Characters(available: 1, collectionURI: "", items: [CharactersItem(resourceURI: "", name: "")], returned: 1), events: Characters(available: 1, collectionURI: "", items: [CharactersItem(resourceURI: "", name: "")], returned: 1))
        
        self.series = [series1, series2]

    }
    
}
