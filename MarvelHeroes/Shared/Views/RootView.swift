//
//  RootView.swift
//  MarvelHeroes
//
//  Created by Cristian Contreras Velásquez on 29-04-24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var vm: RootViewModel
    
    var body: some View {
        //enrutador de vistas.
        
        switch(vm.status){
    
            
        case .loading:
            LoaderView()
        case .error(error: let errorString):
            ErrorView(error: errorString)
       case .loaded:
            HerosView()
//            MainView()
        }    }
}

#Preview {
    RootView()
        .environmentObject(RootViewModel())
}
