//
//  HeroSeriesRowView.swift
//  MarvelHeroes
//
//  Created by Cristian Contreras Velásquez on 01-05-24.
//

import SwiftUI
import Kingfisher

struct HeroSeriesRowView: View {
    var series: SerieResult //el modelo
    
    var body: some View {
        VStack{
            ZStack{
                KFImage.url(URL(string: series.thumbnail.Image())!)
                
                
                    .placeholder({
                        Image("Marvel_Logo_Red")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .padding([.leading, .trailing],20)
                            .opacity(0.6)
                    })
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding([.leading, .trailing],20)
                    .opacity(0.6)
                    .id(0)
                
                VStack{
                    
                    Text(series.title)
                        .font(.title2)
                        .foregroundStyle(.black)
                        .bold()
                        .padding()
                        .id(1)
                    Spacer()
                }
            }
                
            Text(series.description ?? "")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                    .bold()
                    .id(2)

        }
    }
}



#Preview {
    HeroSeriesRowView(series: MockTest().MockSerieRow)
}
