//
//  NotificationView.swift
//  NadaCart
//
//  Created by Jean Racine on 4/19/24.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        VStack(spacing:16) {
            Image(systemName: "bell")
                .font(.largeTitle)
            Text("No notifications")
                .font(.title3)
        }
        .foregroundStyle(.secondary)
    }
}

#Preview {
    NotificationView()
}
