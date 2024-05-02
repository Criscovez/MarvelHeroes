//
//  HeroSeriesView.swift
//  MarvelHeroes
//
//  Created by Cristian Contreras Velásquez on 01-05-24.
//

import SwiftUI


    struct HeroSeriesView: View {
        @State var heroID: String
        @StateObject var viewModel = viewModelHeros()
        
        //@State private var filter: String = ""
        
        var body: some View {
            NavigationStack{
                List{
                    ForEach(viewModel.series){data in
                 
                        HeroSeriesRowView(series: data)
                       
                  }
                }
            }
            .onAppear{
                //self.viewModel.getHeros(filter: "")
                Task {
                 await   self.viewModel.getSeries(HeroID: heroID)
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
        HerosView(viewModel: viewModelHeros(mocked: true))
    }
