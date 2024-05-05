//
//  HeroRowView.swift
//  MarvelHeroes
//
//  Created by Cristian Contreras Velásquez on 30-04-24.
//

import SwiftUI
import Kingfisher

struct HerosRowView: View {
    var hero: HeroeResult //el modelo
    
    var body: some View {
        VStack{
            
          
            KFImage.url(URL(string: hero.thumbnail.Image())!)
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
                
            Text(hero.name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.gray)
                .bold()
                .id(1)
            
        }
    }
}


#Preview {


    HerosRowView(hero: MockTest().MockHeroRow)

}
