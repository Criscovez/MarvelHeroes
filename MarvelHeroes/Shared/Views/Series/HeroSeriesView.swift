//
//  HeroSeriesView.swift
//  MarvelHeroes
//
//  Created by Cristian Contreras Velásquez on 01-05-24.
//

import SwiftUI


struct HeroSeriesView: View {
    @State var heroID: String
    @StateObject var viewModel = HeroSeriesViewModel()
    
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.series){data in
                    
                    HeroSeriesRowView(series: data)
                    
                }
            }
        }
        .onAppear{
      
            Task {
                await   self.viewModel.getSeries(HeroID: heroID)
            }
        }
        
    }
}

#Preview {
    
    HeroSeriesView(heroID: "1017857", viewModel: HeroSeriesViewModel(mocked: true))
}
