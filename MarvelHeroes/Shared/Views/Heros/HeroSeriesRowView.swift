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
                
                //            AsyncImage(url: URL(string: series.thumbnail.Image())) { Image in
                //
                //                Image
                //                    .resizable()
                //                    .aspectRatio(contentMode: .fit)
                //                    .cornerRadius(10)
                //                    .padding([.leading, .trailing],20)
                //                    .opacity(0.6)
                //            } placeholder: {
                //                Image(systemName: "photo")
                //                    .resizable()
                //                    .aspectRatio(contentMode: .fit)
                //                    .cornerRadius(10)
                //                    .padding([.leading, .trailing],20)
                //                    .opacity(0.6)
                //            }
                VStack{
                    
                    Text(series.title)
                        .font(.title2)
                        .foregroundStyle(.black)
                        .bold()
                        .padding()
                    Spacer()
                }
            }
                
            Text(series.description ?? "")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                    .bold()
                
                //            if let favorite = hero.favorite {
                //                Image(systemName: "heart.circle")
                //                    .resizable()
                //                    .foregroundStyle(favorite ? Color.red : Color.gray)
                //                    .frame(width: 40, height: 40)
                //            }
            
        }
    }
}

//#Preview {
////    HerosRowView(hero: Result(from: <#any Decoder#>, id: UUID(), name: "Goku ", image: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/goku1.jpg?width=300"))
//}
