//
//  ProductDetailView.swift
//  NadaCart
//
//  Created by Jean Racine on 4/19/24.
//

import SwiftUI

struct ProductDetailView: View {
    let product:Product
    @Binding var presented:Bool
    var body: some View {
        NavigationView {
            ScrollView {
                CarouselView()
                ProductDetailViewBody(product: product)
            }
            .navigationBarTitleDisplayMode(.inline)
            .edgesIgnoringSafeArea(.top)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavItem(icon: "xmark")
                        .onTapGesture {
                            presented.toggle()
                        }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavItem(icon: "heart")
                }
            }
            .overlay(alignment: .bottom) {
                ProductDetailFooterView(price: product.price)
            }
        }
    }
}

#Preview {
    ProductDetailView(product: DataService().cart[0], presented: .constant(false))
}


struct NavItem:View {
    let icon:String
    var body: some View {
        Circle()
            .fill(.thinMaterial)
            .frame(width: 40, height: 40)
            .overlay {
                Image(systemName: icon)
            }
    }
}

struct CarouselView:View {
    let images = ["breakfast","salad","pizza"]
    var body: some View {
        TabView {
            ForEach(0..<images.count,id:\.self) { index in
                Image(images[index])
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .frame(height: 320)
    }
}

struct ProductDetailViewBody:View {
    let product:Product
    var body: some View {
        VStack(alignment:.leading,spacing: 30) {
            HStack {
                VStack(alignment:.leading) {
                    Text(product.title)
                        .fontWeight(.bold)
                        .font(.title)
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                            .font(.footnote)
                        Text("4.2 (52 reviews)")
                    }
                }
                Spacer()
                StepperView()
                
            }
            
            
            VStack(alignment:.leading) {
                Text("Descriptions")
                    .foregroundStyle(.secondary)
                
                Text("this is the best tasting food in our inventory")
            }
            
            
            
        }
        .padding()
    }
}

struct StepperView:View {
    var body: some View {
        HStack {
            Image(systemName: "minus")
                .frame(width: 40, height: 35)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(.gray,lineWidth: 1)
                )
            Text("4")
                .frame(width: 20)
            Image(systemName: "plus")
                .frame(width: 40, height: 35)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(.gray,lineWidth: 1)
                )

        }
    }
}

struct ProductDetailFooterView:View {
    let price:Int
    var body: some View {
        HStack {
            
            Text("$\(price).00")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
            Text("Add to Cart")
                .foregroundStyle(.white)
                .frame(width: 140, height: 50)
                .fontWeight(.semibold)
                .background(.accent)
                .clipShape(Capsule())
        }
        .padding(.horizontal)
    }
}
