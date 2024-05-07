//
//  CartViewModel.swift
//  NadaCart
//
//  Created by Jean Racine on 4/19/24.
//

import Foundation
import Observation
import SwiftUI

@Observable class CartViewModel {
    
    var cart:[Product]
    
    init(cart: [Product]) {
        self.cart = cart
    }
    
    func totalPrice() -> Int {
        return cart.reduce(0, { $0 + $1.price })
    }
    
}
