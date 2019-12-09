//
//  CalculatorButtonItem.swift
//  Adam_20191207_SwiftUI_Calculator
//
//  Created by Adam on 2019/12/7.
//  Copyright © 2019 Adam. All rights reserved.
//

import Foundation
import SwiftUI

/// 计算器按钮model
enum CalculatorButtonItem {
    enum Op: String {
        case plus = "+"
        case mins = "-"
        case divide = "÷"
        case mutiply = "x"
        case equal = "="
    }
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
}

extension CalculatorButtonItem {
    var title: String {
        switch self {
        case .digit(let value): return String(value)
        case .dot: return "."
        case .op(let op): return op.rawValue
        case .command(let command): return command.rawValue
        }
    }
    var size: CGSize {
        if case .digit(let value) = self, value == 0 {
            return CGSize(width: 88 * 2 + 8, height: 88)
        }
        return CGSize(width: 88, height: 88)
    }
    
    var backgroundColorName: String {
        switch self {
        case .digit, .dot: return "digitBackground"
        case .op: return "operatorBackground"
        case .command: return "commandBackground"
        }
    }
}

extension CalculatorButtonItem: Hashable {}
