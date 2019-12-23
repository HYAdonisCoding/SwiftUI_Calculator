//
//  SettingRootView.swift
//  Adam_20191218_PokeMaster
//
//  Created by Adonis_HongYang on 2019/12/23.
//  Copyright © 2019 Adam. All rights reserved.
//

import SwiftUI

struct SettingRootView: View {
    var body: some View {
        NavigationView {
            SettingView().navigationBarTitle("设置")
        }
    }
}

struct SettingRootView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRootView()
    }
}
