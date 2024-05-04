//
//  RootViewModel.swift
//  MarvelHeroes
//
//  Created by Cristian Contreras Velásquez on 29-04-24.
//

import Foundation
import Combine

final class RootViewModel: ObservableObject {
    @Published var status = Status.loaded
    
//    //@Published var isLogged: Bool = false
//    @Published var Heros: [HeroeResult]?
    
 //   var suscriptors = Set<AnyCancellable>()
    
    ///Carga los bootcamps
//    func loadBootcamps() {
//        
////        if self.mocked{
////            loadBootcampsTesting()
////            return
////        }
//        
//        
//        URLSession.shared
//            .dataTaskPublisher(for: BaseNetwork().getSessionHeros())
//            .tryMap{
//                guard let response = $0.response as? HTTPURLResponse,
//                      response.statusCode == 200 else {
//                    throw URLError(.badServerResponse)
//                }
//                
//                //todo OK
//                return $0.data
//            }
//            .decode(type: HeroesResponse.self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .sink { completion in
//                switch completion{
//                case .finished:
//                    self.status = .loaded
//                case .failure:
//                    self.status = .error(error: "Error llamada Bootcamps")
//                }
//            } receiveValue: { model in
//                self.Heros = model.data.results
//            }
//            .store(in: &suscriptors)
//    }
    
}
