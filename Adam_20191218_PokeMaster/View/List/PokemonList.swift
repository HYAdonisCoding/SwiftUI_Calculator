//
//  PokemonList.swift
//  Adam_20191218_PokeMaster
//
//  Created by Adonis_HongYang on 2019/12/19.
//  Copyright © 2019 Adam. All rights reserved.
//

import SwiftUI

struct PokemonList: View {
    @State var expandingIndex: Int?
    @State var searchText: String = ""
    
    var body: some View {
        List {
            TextField("搜索", text: $searchText)
                .frame(height: 40)
                .padding(.horizontal, 25)
            ForEach(PokemonViewModel.all) { pokemon in
                PokemonInfoRow(
                    model: pokemon,
                    expanded: self.expandingIndex == pokemon.id
                )
                .onTapGesture {
                    if self.expandingIndex == pokemon.id {
                        self.expandingIndex = nil
                    } else {
                        self.expandingIndex = pokemon.id
                    }
                }
            }
        }.overlay(
            VStack {
                Spacer()
                
            }.edgesIgnoringSafeArea(.bottom)
        )
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
