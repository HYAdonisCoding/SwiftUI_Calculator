//
//  Ability.swift
//  Adam_20191218_PokeMaster
//
//  Created by Adonis_HongYang on 2019/12/19.
//  Copyright © 2019 Adam. All rights reserved.
//

import Foundation

struct Ability: Codable {
    struct Name: Codable, LanguageTextEntry {
        let language: Language
        let name: String
        
        var text: String { name }
    }
    
    struct FlavorTextEntry: Codable, LanguageTextEntry {
        let language: Language
        let flavorText: String
        
        var text: String { flavorText }
    }
    
    let id: Int
    
    let names: [Name]
    let flavorTextEntries: [FlavorTextEntry]
}
