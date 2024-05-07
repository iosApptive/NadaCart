//
//  DetailView.swift
//  NadaCart
//
//  Created by Jean Racine on 4/19/24.
//

import SwiftUI

struct ProductView: View {
    
    var vm:ProductViewModel
    @State private var presented:Bool = false
    
    init(products:[Product]) {
        self.vm =  ProductViewModel(products: products)
    }
    
    var body: some View {
        ScrollView {
            ForEach(vm.products) { product in
                ProductRow(product: product)
                    .onTapGesture {
                        vm.selectedProduct = product
                        presented.toggle()
                    }
            }
        }
        .environment(vm)
        .fullScreenCover(isPresented: $presented, content: {
            ProductDetailView(product: vm.selectedProduct!, presented: $presented)
        })
    }
}

#Preview {
    ProductView(products: [])
}


struct ProductRow:View {
    let product:Product
    var body: some View {
        VStack {
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
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text("4.2 review")
                            .foregroundStyle(.secondary)
                    }
                }
                Spacer()
                VStack(alignment:.trailing) {
                    Text("$\(product.price)")
                        .fontWeight(.semibold)
                    Circle()
                        .fill(.clear)
                        .frame(width: 30, height: 30)
                        .overlay(Circle().stroke(.gray,lineWidth: 0.5))
                        .overlay(
                            Image(systemName: "plus")
                                .font(.footnote)
                        )
                        .onTapGesture {
                            DataService.shared.addToCart(product: product)
                        }
                }
            }
            .padding(.horizontal)
            .padding(.vertical,2)
            
            Divider()
                .padding(.leading)
        }
    }
}
