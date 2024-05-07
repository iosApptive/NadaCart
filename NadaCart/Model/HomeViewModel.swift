//
//  HomeViewModel.swift
//  NadaCart
//
//  Created by Jean Racine on 4/19/24.
//

import Foundation
import Observation

@Observable class HomeViewModel {
    
    var category:[Category]
   
    init(category: [Category]) {
        self.category = category
    }
   
    
}
