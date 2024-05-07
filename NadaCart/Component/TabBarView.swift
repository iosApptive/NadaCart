//
//  TabBarView.swift
//  NadaCart
//
//  Created by Jean Racine on 4/19/24.
//

import SwiftUI

enum Tab:String,CaseIterable {
    case Home,Cart,Account
    
    var icon:String {
        switch self {
        case .Home:
            return "house"
        case .Cart:
            return "cart"
        case .Account:
            return "person"
        }
    }
}

struct TabBarView: View {
    @Binding var selection:Tab
    var body: some View {
        HStack {
            ForEach(Tab.allCases,id:\.self) { tab in
                Spacer()
                ZStack {
                    VStack {
                        Image(systemName: tab.icon)
                            .symbolVariant(selection == tab ? .fill : .none)
                        Text(tab.rawValue)
                    }
                    .foregroundStyle(selection == tab ? .accent : .gray )

                    if tab == .Cart {
                        if !DataService.shared.cart.isEmpty {
                            Circle()
                                .fill(.accent)
                                .frame(width: 25, height: 25)
                                .overlay(
                                    Text("\(DataService.shared.cart.count)")
                                        .foregroundStyle(.white)
                                )
                                .offset(x:8,y:-26)
                        }
                    }
                }
                .onTapGesture {
                    selection = tab
                }
                Spacer()
            }
        }
    }
}

#Preview {
    TabBarView(selection: .constant(.Home))
}
