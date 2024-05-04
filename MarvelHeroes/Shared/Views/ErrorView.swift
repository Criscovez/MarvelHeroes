//
//  ErrorView.swift
//  MarvelHeroes
//
//  Created by Cristian Contreras Velásquez on 30-04-24.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var vm: RootViewModel
    private var textError: String
    
    init(error: String){
        self.textError = error
    }
    
    var body: some View {
        VStack{
            HStack{
            Spacer()
            }
                
            Spacer()
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .frame(width: 200, height: 200)
                .padding()
                .foregroundColor(.red)
                .id(0)
            
           
            Text("Error: \(textError)")
                .foregroundStyle(.red)
                .font(.headline)
                .id(1)
            
            
            Spacer()
            
            //Boton de volver
            Button(action: {
                self.vm.status = .loaded
            }, label: {
                Text("Volver")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .frame(width: 300, height: 50)
                    .background(.blue)
                    .cornerRadius(20)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x:20, y:15)
            })
            .padding(.bottom, 20)
            .id(2)
        }
 
    }
}

#Preview {
    ErrorView(error: "Error de prueba preview")
        .environmentObject(RootViewModel())
}
