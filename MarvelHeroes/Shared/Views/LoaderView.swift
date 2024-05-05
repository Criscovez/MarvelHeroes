//
//  LoaderView.swift
//  MarvelHeroes
//
//  Created by Cristian Contreras Velásquez on 30-04-24.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
       Text("Cargando ...")
            .font(.title)
            .foregroundStyle(.red)
            .bold()
            .id(1)
    }
}

#Preview {
    LoaderView()
}
