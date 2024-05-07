//
//  Product.swift
//  NadaCart
//
//  Created by Jean Racine on 4/19/24.
//

import Foundation

struct Product:Identifiable {
    let id:UUID = .init()
    let title:String
    let thumbnail:String
    let price:Int
    let like = false
    let unit = 0
}
