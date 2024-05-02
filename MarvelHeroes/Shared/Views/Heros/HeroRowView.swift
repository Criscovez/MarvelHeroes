//
//  HeroRowView.swift
//  MarvelHeroes
//
//  Created by Cristian Contreras Velásquez on 30-04-24.
//

import SwiftUI

struct HerosRowView: View {
    var hero: HeroeResult //el modelo
    
    var body: some View {
        VStack{
            
            AsyncImage(url: URL(string: hero.thumbnail.Image())) { Image in
               
                Image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding([.leading, .trailing],20)
                    .opacity(0.6)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding([.leading, .trailing],20)
                    .opacity(0.6)
            }

            
            Text(hero.name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
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
