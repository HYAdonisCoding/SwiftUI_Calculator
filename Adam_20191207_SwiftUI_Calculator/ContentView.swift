//
//  ContentView.swift
//  Adam_20191207_SwiftUI_Calculator
//
//  Created by Adam on 2019/12/7.
//  Copyright © 2019 Adam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button.init(action: {
            print("Button : + ")
        }) {
            Text("+")
            .font(.system(size: 38))
            .foregroundColor(.white)
            .frame(width: 88, height: 88, alignment: .center)
            .background(Color.orange)
            .cornerRadius(44)
        }
        
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
