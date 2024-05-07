//
//  Category.swift
//  NadaCart
//
//  Created by Jean Racine on 4/19/24.
//

import Foundation

struct Category:Identifiable {
    let id:UUID = .init()
    let title:String
    let thumbnail:String
    let products:[Product]
}


