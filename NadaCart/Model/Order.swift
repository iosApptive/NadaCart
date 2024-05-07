//
//  Order.swift
//  NadaCart
//
//  Created by Jean Racine on 4/19/24.
//

import Foundation

struct Order:Identifiable {
    let id:UUID = .init()
    let product:[Product]
    let orderType:OrderType
}

enum OrderType {
    case pickup, delivery
}
