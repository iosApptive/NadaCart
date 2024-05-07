//
//  ContentView.swift
//  NadaCart
//
//  Created by Jean Racine on 4/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection:Tab = .Home

    var body: some View {
        TabView(selection:$selection) {
            HomeView()
                .tag(Tab.Home)
                
            CartView()
                .tag(Tab.Cart)
                
            AccountView()
                .tag(Tab.Account)
                
        }
        .overlay(alignment: .bottom) {
            TabBarView(selection: $selection)
        }
    }
}

#Preview {
    ContentView()
}
