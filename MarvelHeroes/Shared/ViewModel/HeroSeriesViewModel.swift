//
//  HeroSeriesViewModel.swift
//  MarvelHeroes
//
//  Created by Cristian Contreras Velásquez on 03-05-24.
//

import Foundation

final class HeroSeriesViewModel: ObservableObject {
    @Published var series: [SerieResult] = []
    //@Published var status = Status.loaded
    
    
    var mocked: Bool = false //para sabrr si estoy en modo Mockeado
    
    init(mocked : Bool = false){
        self.mocked = mocked
    }
    
    func getSeries(HeroID: String) async {
        
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
    
    func getHerosMock(){
        //mockear los modelos.
        
        //        let hero1 = Hero(id: UUID(), name: "Goku", image: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/goku1.jpg?width=300")
        //
        //        let hero2 = Hero(id: UUID(), name: "Vegeta", image: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/vegetita.jpg?width=300")
        
        
        //self.heros = [hero1, hero2]
        
    }
    
}
