//
//  ContentView.swift
//  Adam_20191207_SwiftUI_Calculator
//
//  Created by Adam on 2019/12/7.
//  Copyright © 2019 Adam. All rights reserved.
//

import SwiftUI
import Combine

class Miao: ObservableObject {
    init(a: Int) {
        self.a = a
    }
    var a: Int
    func miao() {
        print("\(a)")
    }
}

let scale: CGFloat = UIScreen.main.bounds.width / 414

struct ContentView: View {
    
    @EnvironmentObject var model: CalculatorModel
    
    @State private var editingHistory = false
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Button("操作履历: \(model.history.count)") {
                self.editingHistory = true
            }.sheet(isPresented: self.$editingHistory) {
                HistoryView(model: self.model)
            }
            
            Text(model.brain.output)
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24 * scale)
                .lineLimit(1)
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       alignment: .trailing)
            
            CalculatorButtonPad()
                .environmentObject(Miao(a: 1))
                .padding(.bottom)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            ContentView().environment(\.colorScheme, .dark)
            ContentView()
            ContentView().previewDevice("iPhone SE")
            ContentView().previewDevice("iPad Air 2")
        }
        
    }
}
#endif

struct CalculatorButton: View {
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let foregroundColor: Color
    let action: () -> Void

    var body: some View {
        Button.init(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(foregroundColor)
                .frame(width: size.width, height: size.height, alignment: .center)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width/2)
        }
    }
}

struct CalculatorButtonRow: View {
    let row : [CalculatorButtonItem]
    @EnvironmentObject var model: CalculatorModel
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(
                title: item.title,
                size: item.size,
                backgroundColorName: item.backgroundColorName,
                foregroundColor: item.foregroundColor) {
                    self.model.apply(item)
                    print("Button : \(item.title) ")
                }}

        }
    }
}

struct CalculatorButtonPad: View {
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
    [.digit(7), .digit(8), .digit(9), .op(.mutiply)],
    [.digit(4), .digit(5), .digit(6), .op(.mins)],
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

struct HistoryView: View {
    @ObservedObject var model: CalculatorModel
    var body: some View {
        VStack {
            if model.totalCount == 0 {
                Text("没有履历")
            } else {
                HStack {
                    Text("履历").font(.headline)
                    Text("\(model.historyDetail)").lineLimit(nil)
                }
                HStack {
                    Text("显示").font(.headline)
                    Text("\(model.brain.output)")
                }
                Slider(value: $model.slidingIndex, in: 0...Float(model.totalCount), step: 1)
            }
        }.padding()
    }
}
