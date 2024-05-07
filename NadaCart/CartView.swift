//
//  CartView.swift
//  NadaCart
//
//  Created by Jean Racine on 4/19/24.
//

import SwiftUI

struct CartView: View {
    var vm = CartViewModel(cart: DataService.shared.cart)
    
    var body: some View {
        VStack {
            if !vm.cart.isEmpty {
                ScrollView {
                    ForEach(vm.cart) { product in
                        CartRow(product: product)
                    }
                    .onDelete { indexSet in
                        vm.cart.remove(atOffsets: indexSet)
                    }

                    
                    CartFooterView(count: vm.totalPrice())
                }
                
            } else {
                EmptyView()
            }
        }
    }
    
    
}

#Preview {
    CartView()
}

struct CartRow:View {
    let product:Product
    var body: some View {
        HStack(alignment:.top) {
            Image(product.thumbnail)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .clipped()
            VStack(alignment: .leading) {
                Text(product.title)
                    .fontWeight(.semibold)
                Text("unit:2")
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text("$\(product.price)")
                .fontWeight(.semibold)
        }
        .padding(.horizontal)
        .padding(.vertical,2)
    }
}


struct CartFooterView:View {
    var count:Int
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Total")
                    .fontWeight(.regular)
                Text("$\(count)")
                    .fontWeight(.black)
            }
            Spacer()
            Capsule()
                .fill(.accent)
                .frame(width: 200, height: 60)
                .overlay(
                    Text("Order Now")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                )
        }
        .padding()
    }
}

struct EmptyView:View {
    var body: some View {
        VStack {
            Image(systemName: "cart")
            Text("Your cart is empty")
        }
        .foregroundStyle(.secondary)
    }
}
