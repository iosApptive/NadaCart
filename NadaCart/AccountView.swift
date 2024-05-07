//
//  AccountView.swift
//  NadaCart
//
//  Created by Jean Racine on 4/19/24.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        ScrollView {
            VStack(alignment:.leading) {
                AccountHeader()
                LoginButton()
                HStack {
                    Text("Don't have and account?")
                        .foregroundStyle(.secondary)
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
            .padding()
        }
    }
}

#Preview {
    AccountView()
}


struct AccountHeader:View {
    var body: some View {
        VStack(alignment: .leading,spacing: 16) {
            Text("Profile")
                .fontWeight(.bold)
                .font(.title)
            
            Text("Login to make your next order")
                .foregroundStyle(.secondary)
        }
    }
}

struct LoginButton:View {
    var body: some View {
        Text("Login")
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(.accent)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.vertical)
    }
}
