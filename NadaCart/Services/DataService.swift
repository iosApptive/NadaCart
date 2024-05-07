//
//  DataService.swift
//  NadaCart
//
//  Created by Jean Racine on 4/19/24.
//

import Foundation
import Observation

@Observable class DataService {
    
    static let shared = DataService()
    
    var categroy:[Category] = []
    var cart:[Product] = []
    
    
    init() {
        self.categroy = loadCategory()
    }
    
    func addToCart(product:Product) {
        self.cart.append(product)
    }
    
    private func getBreafast() -> [Product] {
        let breakfast:[Product] = [
            .init(title: "sausage", thumbnail: "breakfast", price: 12),
            .init(title: "pancake", thumbnail: "breakfast", price: 8),
            .init(title: "eggs", thumbnail: "breakfast", price: 5),
        ]
        return breakfast
    }
    
    private func getSeafood() -> [Product] {
        let breakfast:[Product] = [
            .init(title: "sausage", thumbnail: "seafood", price: 12),
            .init(title: "pancake", thumbnail: "pizza", price: 8),
            .init(title: "eggs", thumbnail: "breakfast", price: 5),
        ]
        return breakfast
    }
    
    private func getSalad() -> [Product] {
        let breakfast:[Product] = [
            .init(title: "sausage", thumbnail: "salad", price: 12),
            .init(title: "pancake", thumbnail: "breakfast", price: 8),
            .init(title: "eggs", thumbnail: "salad", price: 5),
        ]
        return breakfast
    }
    
    private func getPizza() -> [Product] {
        let breakfast:[Product] = [
            .init(title: "sausage", thumbnail: "seafood", price: 12),
            .init(title: "pancake", thumbnail: "breakfast", price: 8),
            .init(title: "eggs", thumbnail: "pizza", price: 5),
        ]
        return breakfast
    }
    
    private func loadCategory() -> [Category] {
        let category:[Category] = [
            .init(title: "Breafast", thumbnail: "breakfast", products: getBreafast()),
            .init(title: "Seafood", thumbnail: "seafood", products: getSeafood()),
            .init(title: "Salad", thumbnail: "salad", products: getSalad()),
            .init(title: "Pizza", thumbnail: "pizza", products: getPizza()),
        ]
        return category
    }
    
}
