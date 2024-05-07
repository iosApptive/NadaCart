//
//  HomeView.swift
//  NadaCart
//
//  Created by Jean Racine on 4/19/24.
//

import SwiftUI

struct HomeView: View {
    var vm = HomeViewModel(category: DataService().categroy)
    @State private var presented:Bool = false
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(vm.category) { category in
                    NavigationLink {
                        ProductView(products: category.products)
                    } label: {
                        CategoryCard(category: category)
                    }
                }
            }
            .navigationTitle("Nada Cart")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "bell")
                        .onTapGesture {
                            presented.toggle()
                        }
                }
            }
            .sheet(isPresented: $presented, content: {
                NotificationView()
            })
        }
    }
}

#Preview {
    HomeView()
}

struct CategoryCard:View {
    let category:Category
    var body: some View {
        ZStack(alignment:.bottomTrailing) {
            Image(category.thumbnail)
                .resizable()
                .scaledToFill()
                .frame(height: 120)

            
            Text(category.title)
                .font(.title)
                .foregroundStyle(.white)
                .padding(.horizontal)
                .background(.thinMaterial)
                .clipShape(Capsule())
                .padding()
        }
        .frame(height: 120)
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .padding(.horizontal)

            
    }
}



