//
//  viewModelHeros.swift
//  MarvelHeroes
//
//  Created by Cristian Contreras Velásquez on 30-04-24.
//

import Foundation


final class HerosViewModel: ObservableObject {
    @Published var heros: [HeroeResult] = []

    @Published var status = Status.loaded
    
    //var suscriptors = Set<AnyCancellable>()
    var mocked: Bool = false //para sabrr si estoy en modo Mockeado
    
    init(mocked : Bool = false){
        self.mocked = mocked
    }
    
    func getHeros() async {

        do {
            let (data, response) = try await URLSession.shared.data(for: BaseNetwork().getSessionHeros())
            
            if let resp = response as? HTTPURLResponse {
                if resp.statusCode == HTTPRresponseCodes.SUCESS {
                    //modelReturn = try! JSONDecoder().decode([HerosModel].self, from: data)
                                let modelReturn = try JSONDecoder().decode(HeroesResponse.self, from: data)
                                Task{@MainActor in
                                    heros = modelReturn.data.results
                                }
                }
            }
            
//            let response = try JSONDecoder().decode(HeroesResponse.self, from: data)
//            Task{@MainActor in
//                heros = response.data.results
//            }
        } catch {
            status = Status.error(error: "---> error: \(error)")
            
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
