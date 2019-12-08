//
//  ContentView.swift
//  Adam_20191207_SwiftUI_Calculator
//
//  Created by Adam on 2019/12/7.
//  Copyright © 2019 Adam. All rights reserved.
//

import SwiftUI

struct CalculatorButtonPad: View {
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
    [.digit(7), .digit(8), .digit(9), .op(.mutiply)],
    [.digit(1), .digit(2), .digit(3), .op(.plus)],
    [.digit(0), .dot, .op(.equal)]]
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { row in
                CalculatorButtonRow(row: row)
            }
        }
    }
}

struct ContentView: View {
    
    var body: some View {
        CalculatorButtonPad()
        
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

struct CalculatorButton: View {
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let action: () -> Void
    
    var body: some View {
        Button.init(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(.white)
                .frame(width: size.width, height: size.height, alignment: .center)
                .background(Color.orange)
                .cornerRadius(size.width/2)
        }
    }
}

struct CalculatorButtonRow: View {
    let row : [CalculatorButtonItem]
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(title: item.title, size: item.size, backgroundColorName: item.backgroundColorName) {
                    print("Button : \(item.title) ")
                }}

        }
    }
}

