//
//  PokemonRootView.swift
//  Adam_20191218_PokeMaster
//
//  Created by Adonis_HongYang on 2019/12/19.
//  Copyright © 2019 Adam. All rights reserved.
//

import SwiftUI

struct PokemonRootView: View {
    var body: some View {
        NavigationView {
            PokemonList().navigationBarTitle("宝可梦列表")
        }
    }
}

struct PokemonRootView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonRootView()
    }
}
