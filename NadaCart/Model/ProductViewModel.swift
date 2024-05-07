//
//  ProductViewModel.swift
//  NadaCart
//
//  Created by Jean Racine on 4/19/24.
//

import Foundation
import Observation

@Observable class ProductViewModel {
    
    var products:[Product]
    var selectedProduct:Product?
    
    init(products: [Product]) {
        self.products = products
    }
    
   
}
