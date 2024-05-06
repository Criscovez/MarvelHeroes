//
//  HerosView.swift
//  MarvelHeroes
//
//  Created by Cristian Contreras Velásquez on 30-04-24.
//

import SwiftUI

struct HerosView: View {
    @StateObject var viewModel = HerosViewModel()
    
    //@State private var filter: String = ""
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.heros){data in
                    NavigationLink {
                        //Destination
                        HeroSeriesView(heroID: String(data.id))
                    } label: {
                        //Label (celda personalizada en UIKit)
                        HerosRowView(hero: data)
                    } .id(0)
                   
                }
                .padding(.vertical)
            }
        }
        .onAppear{
            //self.viewModel.getHeros(filter: "")
            Task {
             await   self.viewModel.getHeros()
            }
        }
//        .searchable(text: $filter,prompt: Text("buscar por nombre"))
//        .onChange(of: filter) { _, newValue in
//            //Llamar al viewModel.
//            //self.viewModel.getHeros(filter: newValue)
//            Task {
//                
//                
//               await self.viewModel.getHeros()
//            }
//        }
    }
}

#Preview {
    HerosView(viewModel: HerosViewModel(mocked: true))
}
