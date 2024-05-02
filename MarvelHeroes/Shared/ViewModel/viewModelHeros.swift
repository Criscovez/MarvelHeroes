//
//  viewModelHeros.swift
//  MarvelHeroes
//
//  Created by Cristian Contreras Velásquez on 30-04-24.
//

import Foundation
import Combine

final class viewModelHeros: ObservableObject {
    @Published var heros: [HeroeResult] = []
    @Published var series: [SerieResult] = []
    @Published var status = Status.none
    
    var suscriptors = Set<AnyCancellable>()
    var mocked: Bool = false //para sabrr si estoy en modo Mockeado
    
    init(mocked : Bool = false){
        self.mocked = mocked
    }
    
    func getHeros() async {
        guard let url = URL(string: "https://gateway.marvel.com/v1/public/characters?ts=1&apikey=4c64c5a2e16fb54ba9b851005b3d85fb&hash=09a08b86af7b3f5c25391bbf70249b8e") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(HeroesResponse.self, from: data)
            Task{@MainActor in
                heros = response.data.results
            }
        } catch {
            print("---> error: \(error)")
        }
    }
    
    func getSeries(HeroID: String) async {
        guard let url = URL(string: "https://gateway.marvel.com/v1/public/characters/\(HeroID)/series?apikey=4c64c5a2e16fb54ba9b851005b3d85fb&ts=1&hash=09a08b86af7b3f5c25391bbf70249b8e&orderBy=-modified") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(SeriesResponse.self, from: data)
            Task{@MainActor in
                series = (response.data.results)
            }
        } catch {
            print("---> error: \(error)")
        }
    }
            
//    func getHeros(filter: String){
//        status = .loading
//        
//        //mockeado
//        if self.mocked{
//            getHerosMock()
//            return
//        }
//        
//        URLSession.shared
//            .dataTaskPublisher(for: BaseNetwork().getHeros())
//            .tryMap{
//                guard let response = $0.response as? HTTPURLResponse,
//                      response.statusCode == 200 else {
//                    throw URLError(.badServerResponse)
//                }
//                
//                print($0.data)
//                return $0.data  //devulevo el body de response.
//            }
//            .decode(type: Welcome.self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .sink { completion in
//                switch completion{
//                case .finished:
//                    //OK
//                    self.status = .loaded
//                case .failure:
//                    //Error
//                    self.status = .error(error: "Error en la llamada")
//                }
//            } receiveValue: { heros in
//                //self.heros = heros.data.results
//            }
//            .store(in: &suscriptors)
//    }
    
    
    
    
    func getHerosMock(){
        //mockear los modelos.

//        let hero1 = Hero(id: UUID(), name: "Goku", image: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/goku1.jpg?width=300")
//        
//        let hero2 = Hero(id: UUID(), name: "Vegeta", image: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/vegetita.jpg?width=300")

        
        //self.heros = [hero1, hero2]
        
    }
    
}
